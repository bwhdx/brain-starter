---
type: meta
created:
---

# Workflows — how to actually use the vault

Capture is frictionless. Processing is deliberate. The load-bearing discipline is the weekly ritual that turns Inbox into Atoms.

## 1. Daily capture

**Tool:** Daily Notes plugin (Obsidian core).

Open today's Daily Note (`10 Daily/YYYY-MM-DD.md`). Dump whatever's on the mind throughout the day: meeting notes, observations, decisions made, fragments. Daily notes are *raw*, not refined. Stuff worth keeping graduates to atoms during the weekly ritual.

## 2. Inbox capture

**Tool:** QuickAdd plugin hotkey (`new inbox note`).

For anything *not* tied to today — links to keep, ideas without context, screenshots, things you'll process later. Drops straight into `00 Inbox/` with auto-frontmatter `type: capture, processed: false`.

## 3. Voice-note pipeline

**Manual today:** record voice memo → dictate via Otter/Whisper/native iOS transcription → paste into `00 Inbox/voice/YYYY-MM-DD-HHMM.md`.

**Automated later (optional):** iOS Shortcut → Whisper transcription → Obsidian URL scheme → lands in `00 Inbox/voice/` with `type: capture, source: voice`.

## 4. Weekly processing ritual — the load-bearing one

**Cadence:** once a week. Sunday afternoon is the conventional slot. Pick yours and commit.

**Steps:**

1. Open `00 Inbox/`. Walk through every item.
2. For each item, decide:
   - **Atom?** Distill into one or more atoms in `20 Atoms/`. Tag, link, set `status: seedling`. Delete or archive the inbox item.
   - **Source?** Move to `40 Sources/` with proper frontmatter.
   - **Seed?** Move to `50 Content/Bank/` with frontmatter.
   - **Project note?** Move into the relevant `70 Projects/` folder.
   - **Junk?** Delete or move to `99 Archive/` if there's some sentimental attachment.
3. Open `10 Daily/` for the past week. Scan each day's note. Anything worth promoting? Same triage.
4. Open the Bases view "Atoms — Recent seedlings". Pick 1–3 seedlings to refine (graduate to `budding` or `evergreen`).
5. Done. Close the laptop.

**If you skip three Sundays in a row,** declare bankruptcy. Archive `00 Inbox/` wholesale and start fresh. Do not attempt to process backlog — the system fails when processing becomes a chore.

## 5. Content production (optional module)

1. **Seeds.** Capture ideas as they come, drop into `50 Content/Bank/` with frontmatter. Status: `raw`.
2. **Shape.** Refine a seed: pillar, format, sources linked, the voice formula assessed. Status: `shaped` when there's something usable.
3. **Draft.** Promote shaped seed into `50 Content/Drafts/{channel}/` with the actual draft text. Status: `draft`.
4. **Pre-publish gate.** Run the draft through `50 Content/Brand/Pre-publish gate.md`. Fix what fails. When all gates pass, status: `ready`.
5. **Ship.** Post on the channel. Move to `50 Content/Published/`. Status: `posted`. Add `engagement_notes:` after a week.

## 6. Reading

- **Add a book:** create a note in `40 Sources/Books/{Title}.md` from the source-book template. Status: `to-read`.
- **Start reading:** set `status: reading`, `date_started: today`.
- **Highlights / atoms:** as you read, extract ideas into `20 Atoms/` (kind: `quote` or `concept`). Each atom has `source: [[Book name]]` — book becomes the source node.
- **Finish:** `status: read`, `date_read: today`, `rating: 1-5`, write a review in the body.
- **Currently reading:** the Bases view "Reading — Currently" surfaces what you're in.

## 7. People (optional module)

- **New person:** create in `60 People/{group}/{Name}.md` from the person template.
- **After a conversation:** open the note, add to a `## Conversations` section. Update `last_contact`.
- **Follow-up:** set `follow_up: 2026-06-15`. The Bases view "People — Follow-ups due" surfaces it.

## 8. Projects (optional module)

- **New project:** create folder `70 Projects/{Project name}/`. Inside, create `README.md` from the project template.
- **Work in flight:** keep notes inside the project folder, link freely to atoms/people/sources.
- **Done:** set `status: done`, move folder to `99 Archive/Projects/`.

## 9. Decisions (optional module)

- **Important call coming up?** Create `90 Decisions/{YYYY-MM-DD Title}.md` from the decision template. Capture: what you chose, why, alternatives, confidence, what was uncertain.
- **Revisit:** Bases view "Decisions — To revisit" surfaces decisions whose `revisit` date has passed. Open, add a `## Review` section: what actually happened, would you make the same call.

## 10. Areas

Areas are ongoing domains, not projects. Each area folder has a `README.md` and accumulates notes over time. No state machine — just write into them when there's something to say. The README serves as the area's own little MOC.

## 11. Maps (MOCs)

When a theme keeps showing up across atoms/sources/projects, make a Map. `30 Maps/{Theme}.md`, type: `map`. List the relevant notes with a one-line context for each. The Map is hand-curated navigation; the graph view is the messy version.

## 12. Asking the brain questions

See `How to use this brain.md` (vault root) for the six categories of question Claude excels at and how to phrase queries for best results.
