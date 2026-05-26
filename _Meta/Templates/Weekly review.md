---
type: weekly-review
date: <% tp.date.now("YYYY-MM-DD") %>
week_of: <% tp.date.now("YYYY-MM-DD", -tp.date.weekday()) %>
---

# Weekly review — week ending <% tp.date.now("D MMM YYYY") %>

10–20 minutes. Sunday afternoon. The load-bearing discipline that keeps the vault alive.

## 1. Process inbox (5 min)

- [ ] Walk through `00 Inbox/` — graduate each item to:
  - **Atom** → `20 Atoms/{Concepts,Beliefs,Moments,Quotes,Observations}/`
  - **Source** → `40 Sources/{Books,Articles,Talks,Podcasts}/`
  - **Seed** → `50 Content/Bank/`
  - **Project note** → relevant `70 Projects/{name}/`
  - **Junk** → delete
- [ ] Clear `00 Inbox/voice/` if used

## 2. Process last week's daily notes (3 min)

- [ ] Scan `10 Daily/` for the past 7 days
- [ ] Anything worth promoting? Same triage as inbox.

## 3. Refresh state (3 min)

- [ ] Update [[Now]] — focus, currently reading, open decisions, active projects, people, top-of-mind
- [ ] Active project READMEs: update status / blockers / next step
- [ ] Open Bases view **Decisions — Revisit**: any decisions to review?
- [ ] Open Bases view **People — Follow-ups**: any contacts due?

## 4. Tend atoms (3 min)

- [ ] Open Bases view **Atoms — Recent seedlings**
- [ ] Pick 1–3 to refine: add links, sharpen prose, promote `seedling` → `budding` or `budding` → `evergreen`
- [ ] Any unconnected atoms? Find the right Map under `30 Maps/` and add a link

## 5. Reading (1 min)

- [ ] If currently reading: update progress; capture any insights as atoms with `source: [[Book name]]`
- [ ] If finished a book: set `status: read`, `date_read: today`, `rating`, write a one-paragraph review

## 6. Content (2 min)

- [ ] Open Bases view **Content — Bank seeds**: any ready to draft?
- [ ] Open Bases view **Content — Drafts**: any draft ready to schedule?

## 7. Reflect (3 min)

Answer in prose. Don't list-spam.

- **What pulled my attention this week?**
- **What did I learn?** *(at least one specific thing)*
- **What's the next single most important thing?** *(one — not three)*

## 8. Close

- [ ] Commit + push (Obsidian Git does this hourly, but a manual commit with the weekly-review message is a useful checkpoint)
- [ ] Close the laptop

---

**Skipped a Sunday?** Catch it next week. **Skipped three in a row?** Declare bankruptcy: archive `00 Inbox/` wholesale, start fresh. Do not try to process backlog.
