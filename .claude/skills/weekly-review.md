---
name: weekly-review
description: Walk the user through the Sunday weekly review ritual interactively. 10-20 min. Processes inbox, refreshes Now.md, tends atoms, surfaces decisions due for review.
---

# /weekly-review — the Sunday ritual

Interactive walkthrough of the weekly review (template at `_Meta/Templates/Weekly review.md`). 10-20 minutes. The single load-bearing discipline that keeps the vault alive.

## Open with

"Sunday review. Should take 15-20 minutes. I'll walk you through each step. Tell me when you're ready, or hit pass on any step you want to skip."

## Walk the eight steps

### 1. Inbox processing (5 min)

List the contents of `00 Inbox/`. For each item, propose: graduate to atom (which kind), move to source, move to seed, move to project, or delete. Let the user decide each one. After processing, summarise what happened.

### 2. Daily notes scan (3 min)

List the last 7 daily notes (`10 Daily/{date}.md`). Ask the user if anything jumps out worth promoting. Same triage as inbox.

### 3. State refresh (3 min)

Open `Now.md`. Ask:
- This week's focus — what is it?
- Last week's win — what landed?
- Currently reading — still accurate?
- Open decisions — any new ones? Any closed?
- Active projects — any new motion?
- People — anyone you've been meaning to reach out to?
- Top-of-mind — what's rattling?

Update `Now.md` with the answers.

Then check Bases views:
- **Decisions — Revisit:** any decisions whose `revisit` date has passed? Surface them. If yes, ask the user to walk through the review (could be its own conversation).
- **People — Follow-ups:** any contacts due? Surface them.

### 4. Tend atoms (3 min)

Open the Bases view *"Atoms — Recent seedlings"* (or grep `20 Atoms/` for `status: seedling` modified in last 30 days). Pick 1-3 to refine with the user. For each: add links, sharpen prose, propose promoting `seedling → budding` or `budding → evergreen`.

### 5. Reading (1 min)

Ask: "Currently reading anything? Need to log progress?" If yes: update the source note. If finished a book: walk the finish ritual (status, date_read, rating, one-paragraph review, suggested atoms to extract).

### 6. Content (2 min — skip if no content module)

Surface Content — Bank seeds and Content — Drafts. Ask if anything is ripe to draft or ready to ship.

### 7. Reflect (3 min)

Three questions, prose answers not bullets:
1. What pulled my attention this week?
2. What did I learn? (one specific thing)
3. What's the next single most important thing?

Write the answers into today's daily note under `## Weekly reflection`.

### 8. Close

- Confirm git status — anything to commit? If Obsidian Git auto-commit is on, this is automatic; otherwise prompt for a manual commit with message *"weekly-review: {date}"*.
- "Done. Close the laptop. See you next week."

## If the user wants to bail

Honour it. "OK, partial review is better than no review. We did steps 1-4. Pick this up next Sunday and prioritise the ones we skipped."

## If they've skipped 3 weeks in a row

Honestly surface it: "You've missed 3 Sundays. Per the brain's own bankruptcy rule, the right move now is: archive `00 Inbox/` wholesale rather than try to process backlog. Want me to do that and start fresh?"
