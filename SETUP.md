# Setup guide

How to go from a freshly-cloned repo to a working brain in ~45 minutes.

## What you'll need

- **A computer.** Mac, Linux, or Windows.
- **Obsidian.** Free download from [obsidian.md](https://obsidian.md). The vault is just markdown files in folders, so technically any editor works — but Obsidian's graph, backlinks, Bases, and Templater are what make this template sing.
- **Claude Code.** Free during the beta. Install instructions at [claude.com/code](https://claude.com/code). The setup wizard is a Claude skill — you can populate the vault by hand, but Claude makes it a 45-minute conversation instead of a multi-day chore.
- **A GitHub account** (optional but recommended). The setup wizard can create a private repo for offsite backup.

## Step 1 — Clone the repo

```bash
git clone https://github.com/<the-template-owner>/brain-starter ~/Brain
cd ~/Brain
```

You can put it anywhere. `~/Brain` is short and obvious. If you have an existing `Brain` folder, pick a different name.

## Step 2 — Open in Obsidian

1. Open Obsidian
2. *"Open folder as vault"*
3. Select the folder you just cloned

You should see the 10 numbered folders (`00 Inbox/` through `99 Archive/`) plus `_Meta/` and `_Wiki/` in the file explorer.

## Step 3 — Run the setup wizard

From any terminal:

```bash
cd ~/Brain
claude
```

When Claude starts, run:

```
/setup
```

The wizard will introduce itself and ask ~15-20 questions over 30-45 minutes. Take your time on the identity questions — those are what the rest of the vault hangs off of. The wizard branches based on what you want (content creation? decision journal? relationship tracking?), so you only fill in what's relevant.

By the end of the wizard, you'll have:

- `Now.md` dashboard populated with your current state
- `Who I am.md` — the integrating personal narrative
- `Why.md` / `Mission.md` / `Values.md` — the spine
- 9 initial atoms (3 beliefs, 3 moments, 3 concepts) drawn from your answers
- If you opted in to content: voice formula, pillars, channels filled in
- If you opted in to people: 5-10 person stubs
- If you opted in to decisions: one open decision documented
- If you opted in to projects: one active project stub
- A weekly-review template ready to walk on Sunday
- A first daily note for today

## Step 4 — Install plugins

Open Obsidian → Settings → Community plugins → Browse. Install in this order:

**Day-one essentials (4):**

- **Templater** — JS-powered templates. Day-one foundation for consistent frontmatter on every new note.
- **QuickAdd** — hotkeyed capture menus. The "drop a thought into Inbox without leaving my current app" plugin.
- **Linter** — auto-enforces frontmatter schema. Prevents silent drift.
- **Obsidian Git** — versioned offsite backup. Hourly auto-commit + push to your private GitHub repo. Three-tier durability.

**Month-2+ (when justified):**

- **Smart Connections** — local-embedding semantic surface. Useful once vault has 100+ notes.
- **Dataview** — fallback for what Bases can't do (aggregations, calendar views).

**Cap your community plugins at ~10.** Every new plugin is a future break point.

## Step 5 — Configure Obsidian core settings

Settings → Core plugins → enable: Daily Notes, Templates, Properties, Bases, Bookmarks, Sync (paid), Graph, Backlink, Outgoing Link, File Explorer, Search.

Settings → Daily Notes:
- Date format: `YYYY-MM-DD`
- New file location: `10 Daily`
- Template file location: `_Meta/Templates/Daily`

Settings → Templater (community):
- Template folder location: `_Meta/Templates`
- Trigger Templater on new file creation: ON
- Folder templates: map each folder to its appropriate template

## Step 6 — Set up backup (do this on day one)

Three independent backups. Two off-machine.

1. **Obsidian Sync** (paid, ~$5/mo) — primary cross-device sync. Settings → Sync.
2. **Git + GitHub** — the wizard will offer to set this up. Or do it manually:
   ```bash
   gh repo create brain --private --source=. --remote=origin --push
   ```
   Then in Obsidian: Settings → Community plugins → Obsidian Git → enable auto-commit + auto-push every 60 minutes.
3. **Time Machine** (Mac) or equivalent — laptop-level point-in-time recovery.

## Step 7 — The 30-day shakedown

The hardest part of any second brain is showing up to it every day for the first month. The template ships with a project template called *"Brain shakedown — first 30 days"* that you can adopt as a commitment device:

- **Daily minimum:** open `Now.md`. Glance. Close. 30 seconds. That's it.
- **Weekly minimum:** Sunday afternoon, walk the `_Meta/Templates/Weekly review` template. 15-20 minutes.
- **Day 30:** open the project's post-mortem section. Did the habit stick? What broke? Renew, modify, or abandon.

The architecture is finished. The discipline is the unknown variable.

## What to do if you get stuck

- **The wizard didn't finish for some reason** — re-run `/setup` from where you left off. It'll detect what's already populated and skip those questions.
- **You want to skip the wizard entirely** — read `How to use this brain.md` and fill in `Who I am.md`, `Now.md`, and your first atom manually. Slower, but everything works.
- **Plugin questions** — see `_Meta/Plugins.md` for the full rationale.
- **Schema questions** — see `_Meta/Schema.md` for the frontmatter spec.
- **Workflow questions** — see `_Meta/Workflows.md` for the technical reference.

## What NOT to do in the first month

Per the template's own design principles:

1. **Don't restructure the folders.** The architecture was committed for ≥12 months. Tweak inside the structure; restructure rarely.
2. **Don't install more plugins.** Cap is ~10. Live with what's there.
3. **Don't seed empty folders to make them feel "full".** They'll fill from use.
4. **Don't worry about being inconsistent in the first month.** The point of the shakedown is to learn what you actually use, not to perform discipline.

## Where to go next

- `README.md` — the front door
- `How to use this brain.md` — user manual covering daily/weekly/monthly rhythms, the five most-common operations, Claude integration
- `_Meta/Workflows.md` — technical workflow reference
- `_Meta/Schema.md` — frontmatter spec for every note type
- `.claude/README.md` — what each Claude skill does

Welcome to your brain.
