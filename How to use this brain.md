---
id: how-to-use
type: meta
created:
---

# How to use this brain

The user manual. For you, for future-you, and for anyone (or anything) operating inside the vault.

> **TL;DR:** Open [[Now]] daily (30 seconds). Process [[00 Inbox]] weekly (10–20 minutes). Capture frictionlessly, distill deliberately, link densely. Everything else is gardening.

---

## What this is

A personal second brain scaffolded from the `brain-starter` template. Markdown + YAML frontmatter. Designed for a 30-year horizon: substrate doesn't change, content compounds.

The vault has three layers:

1. **Capture** — fast, low-friction, no judgement. (`00 Inbox/`, `10 Daily/`)
2. **Distill** — atomic, refined, evergreen. (`20 Atoms/`, `40 Sources/`)
3. **Navigate** — themed maps that gather related atoms by belief or topic. (`30 Maps/`)

Sources are immutable raw inputs. Atoms are *your* thinking distilled from them. The two are kept separate — *don't confuse the highlight with the insight.*

---

## The four rhythms

### Daily — 30 seconds to 5 minutes

**Minimum:** open [[Now]]. Glance. Close.

**If something's on your mind:** open today's daily note (`10 Daily/YYYY-MM-DD.md`) and dump it. Don't process. Don't perfect. Just capture.

**If something's worth keeping but not tied to today:** drop into `00 Inbox/` with one line of context. Process Sunday.

The daily habit is about *showing up*, not producing. Five minutes of glance-and-capture beats a one-hour Sunday binge.

### Weekly — 10–20 minutes, Sunday

The load-bearing discipline. Walk the [[Weekly review|Weekly review template]] (`_Meta/Templates/Weekly review.md`):

1. Process `00 Inbox/` → graduate items to atoms, sources, seeds, project notes, or junk
2. Scan the last 7 daily notes → promote anything worth keeping
3. Refresh [[Now]] (focus, currently reading, decisions, projects, people, top-of-mind)
4. Pick 1–3 seedling atoms → refine them
5. Reflect briefly (what pulled attention / what you learned / next single most important thing)

**If you miss one week:** catch it next week.
**If you miss three weeks:** declare bankruptcy. Archive the inbox wholesale. Start fresh. Do not try to process the backlog — that's how the system dies.

### Monthly — one intentional re-read

On the first Sunday of each month, in addition to the weekly ritual, **read one thing properly**. Rotate through these — three months apart for each:

1. **[[Who I am]]** — the integrating personal narrative. Drifts fastest because *you* drift. Monthly re-read catches it before the drift becomes invisible.
2. **One theme map** under `30 Maps/` — pick the one that feels distant. Look for missing atoms or collapsed clusters.
3. **[[Brand bible]] + [[Voice formula]]** — if you're producing content. If not, skip.
4. **An identity / philosophy / values document** — pick one. Do an honest re-read. Edit if necessary.

One per month. ~30 min total. Calendar reminder: *"Brain monthly re-read"* first Sunday.

### Quarterly — driven by Bases queries, not articles

Three queries, not reading material:

- **Decisions — Revisit:** what's due review? Open them. Add the `## Review` section: what happened, would you make the same call.
- **Atoms — Recent seedlings:** anything still seedling after 90 days probably won't graduate. Either refine or archive.
- **People — Follow-ups due:** clear the list (if you use the people module).

Housekeeping, not knowledge. ~30 min once a quarter.

---

## Asking the brain questions

The single most powerful way to use the vault.

### Three ways, increasing power

**A) Search inside Obsidian.** `Cmd+O` (quick switcher), `Cmd+Shift+F` (full-text), graph view from any note. Fastest path for "open the note I already know exists".

**B) Browse via maps.** Open [[00 Map]] (vault root) or `30 Maps/`. Maps are hand-curated; they give you the *good* version of a topic, not the messy graph.

**C) Ask Claude.** From any terminal:

```bash
cd ~/Brain && claude
```

Claude reads [[CLAUDE|CLAUDE.md]] on session start and knows the schema. You don't have to explain the vault.

### What works well — six categories of question

**1. Retrieval — "what have I said about X"**
- *"What have I written about [topic]? Pull atoms + the relevant theme map."*
- *"What books have I read on [subject]? Group by rating."*
- *"What did I decide about [topic] and what was the reasoning?"*

**2. Synthesis — connect dots across notes**
- *"Read my atoms on [theme] — what's the shared thread?"*
- *"Look at my last 30 daily notes — what patterns do you see?"*
- *"What themes are emerging in the inbox that I haven't named?"*

**3. Decision-prep — pull context before a hard call**
- *"I'm considering [X]. Pull every atom, decision, and person note that's relevant."*
- *"What did I conclude last time I faced something like [Y]?"*

**4. Drafting — content from atoms**
- *"Draft a LinkedIn post from [[atom]] using my voice formula."*
- *"I want to write about [topic]. What atoms should I pull?"*
- *"Critique this draft against my pre-publish gate. Be ruthless."*

**5. Reflection — coaching from your own thinking**
- *"I had this hard conversation today: [...] What would my values + identity work suggest I reflect on?"*
- *"What atoms haven't I touched in 6 months — worth promoting or archiving?"*

**6. Curation — housekeeping**
- *"Find dangling wikilinks."*
- *"Find atoms without `themes:`."*
- *"Find seedling atoms older than 90 days."*

### How to phrase questions effectively

- **Specify scope.** *"Look in `20 Atoms/Beliefs/`"* is faster than *"look around the vault"*.
- **Name the output shape.** *"Return 5 atoms with a one-line why each"* beats *"tell me about it"*.
- **Ask the question behind the question.** *"What should I read first?"* is more useful than *"should I do X?"*
- **Anchor in real artifacts.** *"Compare this draft to [[the last LinkedIn post that landed]]"* gives Claude something concrete.

---

## The five things you'll do most

### 1. Capture a thought

**Quick (under a sentence):** open today's daily note → drop a bullet under `## What's on my mind`.

**Substantial:** drop a file into `00 Inbox/{timestamp}-{slug}.md` with minimal frontmatter:

```yaml
---
type: capture
created: 2026-05-26
source: chat | voice | web | thought
---
```

**Don't process while capturing.** Sunday's job.

### 2. Promote something into an atom

1. Pick subfolder: `Concepts/` (mental models), `Beliefs/`, `Moments/`, `Quotes/`, `Observations/`
2. Filename: prose, sentence-cased — *"Consistency beats intensity.md"*, not *"20260525-consistency.md"*
3. Use `_Meta/Templates/Atom.md`
4. **Three outbound `[[ ]]` links** — to other atoms or a theme map. An atom without links is a stranded island.
5. **`themes:` in frontmatter** — the relevant theme map under `30 Maps/` will pick it up
6. Body: one idea, clearly stated. Refine over time, don't append-and-forget.

### 3. Log a source

1. `40 Sources/{Books,Articles,Talks,Podcasts}/{clean title}.md` — no `#`, no `/`, no `|`
2. Use the matching `_Meta/Templates/Source-*.md`
3. `authors:` as plain strings (not wikilinks)
4. `status: to-read | reading | read | abandoned | reference`
5. As you consume it: extract *insights* (not highlights) into `20 Atoms/`, each with `source: [[Source name]]`

### 4. Draft content for publishing (optional module)

The flow:

1. **Seed** — raw idea, drop into `50 Content/Bank/`. `status: raw`.
2. **Shape** — refine: pillar, format, sources linked, voice-formula check. `status: shaped`.
3. **Draft** — actual post text in `50 Content/Drafts/{channel}/`. `status: draft`.
4. **Pre-publish gate** — walk every check. Fix what fails. `status: ready`.
5. **Ship** — post on channel. Move to `50 Content/Published/`. `status: posted`. Add `engagement_notes:` after a week.

See `50 Content/Brand/Content process.md` for the full 6-step flow.

### 5. Make a decision

1. `90 Decisions/{YYYY-MM-DD title}.md` from `_Meta/Templates/Decision.md`
2. Capture: what you chose, why, alternatives considered, what you're uncertain about, when to revisit
3. The Bases view "Decisions — Revisit" surfaces decisions whose `revisit` date has passed
4. Open and add a `## Review` section: what actually happened, would you make the same call

---

## The map of the vault

| Folder | What lives here | When you write here |
|--------|-----------------|---------------------|
| `00 Inbox/` | Unprocessed capture | When something's worth keeping but not yet processed |
| `10 Daily/` | One file per day | Anything tied to today |
| `20 Atoms/` | *Your* distilled thinking | After processing a capture or finishing a source |
| `30 Maps/` | Themed navigation | When a theme has 3+ atoms and deserves a hub |
| `40 Sources/` | External material | When you encounter something worth tracking |
| `50 Content/` | Personal content production (optional) | When seeding/drafting/shipping |
| `60 People/` | One file per person (optional) | After a meaningful interaction worth remembering |
| `70 Projects/` | Defined-outcome work (optional) | When something has a start, end, and outcome |
| `80 Areas/` | Ongoing domains | Identity, philosophy, health, travel, reading, etc. |
| `90 Decisions/` | Decision journal (optional) | Before/during a non-trivial decision |
| `99 Archive/` | Cold storage | When a project finishes or content is retired |
| `_Meta/` | Vault infrastructure | Almost never — schema, templates, workflows |
| `_Wiki/` | LLM-wiki layer (deferred) | Not yet — opt in once sources cross ~100 |

Reference docs:
- [[Schema|_Meta/Schema]] — full frontmatter spec
- [[Workflows|_Meta/Workflows]] — technical workflow reference
- [[Plugins|_Meta/Plugins]] — installed plugins and why
- [[Durability|_Meta/Durability]] — backup strategy

---

## Things that break the system

1. **Inbox death.** Skipping the Sunday ritual for ≥3 weeks. Antidote: declared bankruptcy + fresh start. Don't try to clear backlog.
2. **Methodology thrash.** Restructuring top-level folders. The architecture was committed for ≥12 months. Tweak *inside* the structure freely; restructure rarely.
3. **Plugin sprawl.** Cap ~10 community plugins. Every new one is a future break point.
4. **Markdown-portability erosion.** Don't put plugin-specific syntax in note bodies. State goes in frontmatter. View configs (Bases) are acceptable lock-in because the underlying data is portable.
5. **Append-and-forget on atoms.** Atoms get *refined*, not bloated. A 200-word atom with 5 strong links beats a 2000-word atom with none.
6. **Highlighting masquerading as thinking.** Sources hold the receipts. The insight lives in the atom, in your own words. If you can't restate it, you haven't understood it yet.

---

## What's intentionally missing in the template

- **`_Wiki/` LLM-wiki layer** — empty scaffold. Karpathy April 2026 pattern. Opt in once source volume crosses ~100 documents.
- **Voice-note iOS pipeline** — deferred until basic capture habit is sticky. Mac dictation works in the meantime.
- **Pre-populated theme maps, atoms, sources** — these emerge from *your* use, not the template.

---

## Related

- [[Now]] — the dashboard. Open daily.
- [[CLAUDE]] — onboarding doc for Claude Code sessions.
- [[Workflows|_Meta/Workflows]] — technical reference.
