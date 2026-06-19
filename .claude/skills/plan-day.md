---
name: plan-day
description: Morning brief — surfaces the day's plan that triage has already computed (the prioritised Top-6 in today's daily note), set against your real calendar and routines. The downstream presenter of the triage engine.
---

# /plan-day — the morning brief

Deliver the morning brief. The upstream `/triage` engine has already trawled the brain and written today's **Top-6** (plus a `⚡ New:` delta) into the daily note — your job is to **present it** against the real schedule, tight and skimmable. You don't recompute priorities; you surface them.

## Read

- today's daily note `10 Daily/<YYYY-MM-DD>.md` — **primary source.** `triage` fills `## Today's 6` (ranked, each with a why) and a `⚡ New:` line.
- **today's calendar** (if a calendar tool like `gog` is wired) — today's events only.
- `80 Areas/Routines/` — the daily rhythm / non-negotiables.
- **Fallback only** — if the daily note has no `## Today's 6` (triage didn't run), sweep the radars yourself (`To-do backlog.md` `## Now`, due `60 People/**` `follow_up`, overdue items in `80 Areas/Finances/`), and write the Top-6 you assemble into the daily note.

## Produce

A tight brief (no preamble, no sign-off):
1. **Date** — today + day of week.
2. **⚡ New / needs attention** — lead with triage's delta and anything time-critical. Skip if empty.
3. **Today's schedule** — time-ordered events; flag overlaps; name the first sizeable free block.
4. **Today's 6** — surface the ranked Top-6 from the daily note; tie items to *when* where it helps. Present, don't re-rank.
5. **Non-negotiables** — one line from the daily rhythm.
6. **One prompt** — a single question to get moving.

## Daily note (write — only as fallback)

`triage` normally creates today's note. **Only if it's still missing**, create `10 Daily/<YYYY-MM-DD>.md` from the daily template and fill `## Today's 6` from your fallback sweep. If it exists, don't modify it beyond that.

## Rules

- **Present, don't recompute.** Triage owns the ranking; you surface it.
- Short — it's a message, not a document. No wikilinks in YAML.
