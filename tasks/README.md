# Task Board (`dubleslash-tasks`) — setup & deploy

Live, shared task board for Tal + Shenhav. Supabase for data + auth + realtime. Vercel for hosting.

**Live URL (production):** https://tasks-seven-zeta.vercel.app
*(will become `dubleslash-tasks.vercel.app` after the Vercel rename in step 3)*

## Two layers of safety

The site is publicly reachable, but data is locked down by **two independent gates**:

1. **Password auth (Supabase)** — only the two auth accounts created by `bootstrap-users.sql` exist. No one else can sign in; there's no public signup path in the app.
2. **Row-Level Security (Postgres)** — every table policy checks `auth.email() in (select email from allowed_emails)`. Even a leaked anon key reads nothing.

So "live and easy to access" + "super safe" are not in tension here — the Vercel SSO wall is redundant and we keep it OFF (see step 3).

## Git is the source of truth for the board

`main` is the source of truth for the task board's state. Commit a SQL file under [`../supabase/migrations/`](../supabase/migrations/) → push → a GitHub Action applies it to production. No more pasting SQL into the Supabase dashboard.

- **Workflow:** [`.github/workflows/supabase-migrate.yml`](../.github/workflows/supabase-migrate.yml) (triggers on push to `main` touching `supabase/migrations/**`, plus manual run via the Actions tab).
- **Migration filenames** must follow `YYYYMMDDHHMMSS_description.sql` (Supabase CLI convention). Applied in timestamp order.
- **SQL must be idempotent** — re-runs must be no-ops. Use `on conflict do nothing` for seeds, `create table if not exists` for schema, explicit `update` with a `where` clause for state changes.
- **Workflow-skipping files** (manual-only): `bootstrap-users.sql` (holds passwords), `rollback-bootstrap.sql` (destructive). These stay in [`../supabase/`](../supabase/) and are run by hand through the SQL editor when needed.

### One-time CI secret setup

In GitHub → Settings → Secrets and variables → Actions → **New repository secret**, add three:

| Secret | Where to get it |
|---|---|
| `SUPABASE_ACCESS_TOKEN` | [Supabase dashboard → Account → Access Tokens](https://supabase.com/dashboard/account/tokens) → "Generate new token" |
| `SUPABASE_DB_PASSWORD`  | The project's database password (Dashboard → Project Settings → Database → Database password) |
| `SUPABASE_PROJECT_ID`   | `rbuynvswyplfyxuxpyxy` |

After those are set, merge any PR that changes `supabase/migrations/**` and the Action runs automatically. First run against the existing DB will replay every migration; since they're all idempotent, only net-new changes take effect.

## 1. One-time Supabase project bootstrap

Only needed for a **fresh** Supabase project (not the existing one — it's already bootstrapped):

1. Open [Supabase dashboard](https://supabase.com/dashboard) → your project.
2. Run all files in [`../supabase/migrations/`](../supabase/migrations/) in timestamp order (or just push any change to `main` once the CI secrets above are configured; the Action will apply them all).
3. **SQL Editor** → **New query** → open [`../supabase/bootstrap-users.sql`](../supabase/bootstrap-users.sql) → edit the two passwords + Shenhav's real email at the top → paste → **Run**. This creates both auth accounts directly, pre-confirmed, no email round-trip — side-stepping Supabase's magic-link rate limit entirely.

Bootstrap is a one-off. To add a new allowed user later, re-run `bootstrap-users.sql` with their row added (or do it via Dashboard → Authentication → Users → "Add user" → Create new user → tick "Auto Confirm User", *and* insert their email into `public.allowed_emails`).

## 2. Run it locally

Because `index.html` uses ES modules, you need to serve it over HTTP (not `file://`):

```bash
cd tasks
python3 -m http.server 5173
# then open http://localhost:5173
```

Sign in with `talsolomon21@gmail.com` and the password you set in `bootstrap-users.sql`. One screen and you're in — no email.

## 3. Vercel project settings (one-time, dashboard)

The project is already deployed (`talsolomon21-gmailcoms-projects/tasks`). Two settings to fix in the [Vercel dashboard](https://vercel.com/talsolomon21-gmailcoms-projects/tasks/settings):

1. **Settings → Deployment Protection → Vercel Authentication** → set to **Disabled** (or "Only Preview Deployments"). Without this change, Tal and Shenhav both hit a 401 SSO wall before they ever see the gate page. Safety is preserved by the Supabase magic-link + RLS combo above.
2. **Settings → General → Project Name** → rename `tasks` → `dubleslash-tasks` so it's distinguishable from the marketing site project (`website` → `dubleslash-website`). The production URL becomes `https://dubleslash-tasks.vercel.app`. Add that to Supabase redirect URLs (step 1.4) after rename.

**Redeploy after future code changes:**
```bash
cd tasks
npx vercel --prod
```

## Data model (for reference)

| Table           | Purpose                                       |
|-----------------|-----------------------------------------------|
| `allowed_emails`| Who can sign in (RLS gate).                   |
| `groups`        | Marketing / Product / Dev-Sec / …             |
| `people`        | Tal / Shenhav / Claude / Advisor              |
| `statuses`      | Todo / In Progress / Blocked / Review / Done  |
| `priorities`    | P0 / P1 / P2                                  |
| `tasks`         | One row per task                              |
| `kpis`          | M1–M9 OSS-launch scorecard                    |
| `repo_commits`  | Mirror of relevant GitHub activity            |
| `outreach_*`    | Contacts pipeline (stages, contacts)          |
| `interview_*`   | Problem-validation interview pool + live question template + per-interview responses (contacts, stages, buckets, questions, responses) |

RLS: only rows visible/writable to `allowed_emails`. Changes stream to all connected browsers via Supabase Realtime.

## Adding people

1. Insert into `allowed_emails` (gates sign-in).
2. Insert into `people` (exposes them as a task owner). `id` should be a slug; `name` is the display label.
3. If their email's local-part matches their `people.name` (lowercased), "My Week" will follow them automatically. Otherwise, edit `emailToPersonId()` in `index.html` to add the mapping.

## Troubleshooting

- **"Not allowlisted" screen after sign-in** → their email isn't in `allowed_emails`. Re-run `bootstrap-users.sql`.
- **"Invalid login credentials"** → wrong password, or the auth row doesn't exist / got wiped. Re-run `bootstrap-users.sql` to recreate with a known password.
- **Forgot password** → easiest fix: edit the password at the top of `bootstrap-users.sql` and re-run it. The script cleans up and recreates the user.
- **Changes don't appear in other browser** → check Supabase → Database → Replication → `supabase_realtime` publication includes the table. The setup SQL does this, but verify.
- **Changes fail silently** → open browser devtools console; RLS errors show there.
