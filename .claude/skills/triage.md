---
name: triage
description: The upstream priority engine — trawls the whole brain (deadlines, projects, follow-ups, decisions, goals, content, daily-note signals), ranks what matters now, and writes the day's Top-6 into the daily note so plan-day can surface it. The thing that turns a pile of skills into a system.
---

# /triage — recompute what matters now

Rebuild the priority list from *everything* time-bound and signal-bearing in the vault, and write it into the day's state. This is the **upstream** step: it doesn't read the to-do list and read it back, it recomputes priorities from the whole brain, then hands a ranked Top-6 to `/plan-day`. **You may write — only today's daily note `## Today's 6`, and *appending* new items to the to-do backlog's `## Now`.**

## Trawl — read across the brain (use today's date)

**Date-driven (deterministic):**
- `80 Areas/Finances/**` — any filing/obligation **overdue** or due within ~30 days. Overdue + penalty-bearing items rank top.
- `70 Projects/**` — `target_end` approaching/passed; score `outcome_metric` against recent daily-note activity.
- `60 People/**` — `follow_up` ≤ today, `cadence` recurrences, `birthday`/`anniversary` inside lead-time.
- `90 Decisions/**` — `revisit` dates arrived/passed.
- `80 Areas/Goals/**` — `target_date` approaching; `last_reviewed` long ago (a goal gone quiet).
- `50 Content/Published/` vs the cadence target — a channel gone quiet.

**Signal-driven (judgement):**
- recent `10 Daily/` notes — **empty notes = something slipping**; also what's genuinely active.
- `00 Inbox/` + daily-note `## To process` — unprocessed captures.
- `80 Areas/Identity/` (roles/values) — a role or domain gone silent this week.
- `80 Areas/Routines/To-do backlog.md` `## Now` — the existing hand-kept list; **never lose what's written there.**

## Rank

Merge into one ranked list by urgency: hard deadlines (penalty + proximity) > follow-ups due (decayed by `last_contact`) > project metrics slipping > content/role/goal signals. Value-test the top items against your identity notes — the point is *your* priorities, not a generic urgency sort.

## Write (surgical)

1. **Today's 6** — write the ranked top-6 into today's daily note `## Today's 6`, each as `N. <item> — <why/when>`. Create today's `10 Daily/<YYYY-MM-DD>.md` from the daily template if missing. **If a Today's-6 is already hand-written, preserve it and add a short "triage also flags:" line — never overwrite.**
2. **Backlog** — if the trawl surfaces a genuinely new commitment not in `## Now`, **append** it as a `- [ ] <item>`. Append only; never reorder or delete.
3. **Delta** — note what's **newly urgent since yesterday** as a one-line `⚡ New:` so `/plan-day` can lead with it.

## Rules

- **Surgical writes only** — Today's-6 and append-to-Now. Never touch the backlog's other sections, never reorder.
- **No fabrication.** A blank field can't be ranked — skip it. If the trawl is thin, say "quiet — nothing newly pressing" rather than padding.
- Signal over completeness — six items max.
