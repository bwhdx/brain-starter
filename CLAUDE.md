# Brain — instructions for Claude

This is a personal second brain — an Obsidian vault scaffolded from the `brain-starter` template. Karpathy-flavoured "external cognition". Markdown + YAML frontmatter, no proprietary syntax in note bodies.

When invoked inside this vault, your job is to help the user **capture, distill, link, and retrieve** — not to write fluff. Atomic notes. Dense links. Lean prose.

## First time? Run the setup wizard

If this vault is still mostly placeholders (you'll see `[PLACEHOLDER]` markers in `Now.md`, `Who I am.md`, etc.), the user hasn't run the setup wizard yet. Suggest it:

```
/setup
```

The wizard at `.claude/skills/setup.md` walks the user through ~30-45 min of questions and populates the vault from their answers.

## Folder schema (10 numbered + 2 meta)

```
00 Inbox/      Quick capture — drop, don't organize. Processed weekly into Atoms.
10 Daily/      Daily notes (YYYY-MM-DD.md). Raw running log.
20 Atoms/      The user's distilled thinking. One idea per file. Subfolders:
               Concepts/  Beliefs/  Moments/  Quotes/  Observations/
30 Maps/       MOCs. Navigation by theme. Hand-curated link clusters.
40 Sources/    Immutable external inputs. Subfolders:
               Books/  Articles/  Talks/  Podcasts/  Highlights/
50 Content/    Personal content production (OPTIONAL MODULE).
               Bank/ (seeds)  Drafts/ (per channel)  Published/  Brand/ (tooling)
60 People/     One note per person. Quiet CRM (OPTIONAL MODULE).
               Family/  Friends/  Team/  Advisees/  Network/
70 Projects/   Defined-outcome work (OPTIONAL MODULE). One folder per project.
80 Areas/      Ongoing domains of responsibility.
               Identity/  Health/  Travel/  Reading/  Philosophy/  Finances/
               Learning/  Memory/  Goals/  Routines/
90 Decisions/  Decision journal (OPTIONAL MODULE). One note per important decision.
99 Archive/    Cold storage. Don't delete — archive.
_Meta/         Schema, templates, workflows, Bases configs.
_Wiki/         Karpathy LLM-wiki layer (mostly empty scaffold — deferred).
```

## Frontmatter conventions

Every note has YAML frontmatter. `type` is mandatory and drives Bases queries.
Full schemas live in `_Meta/Schema.md`. Quick reference:

| type | required | sample fields |
|------|----------|---------------|
| `atom` | `kind` (concept/belief/moment/quote/observation), `status` (seedling/budding/evergreen) | `themes`, `related` |
| `source` | `kind` (book/article/talk/podcast/highlight), `status` | `authors`, `rating`, `url` |
| `seed` | `pillar`, `format`, `status` | `voice`, `sources` |
| `draft` | `channel`, `status` | `seed`, `target_date` |
| `person` | `name`, `relationship` | `last_contact`, `follow_up` |
| `project` | `status` | `started`, `target_end`, `outcome_metric` |
| `decision` | `date`, `status`, `confidence` | `revisit` |
| `area` | `domain`, `status` | — |
| `map` | — | `tags` |

**Important:** `authors`, `tags`, `themes`, `related` are **plain strings**, NOT wikilinks. Wikilinks in YAML create dangling graph nodes. Use wikilinks only in note bodies.

## Wikilink rules

- Prefer descriptive names over IDs in filenames: `Consistency beats intensity.md` > `20260525-consistency.md`
- `[[Target]]` for same name; `[[Target|alias text]]` for renaming display
- **In Markdown tables**, escape the pipe: `[[Target\|alias]]` — unescaped pipes break the table
- Never link to non-existent notes without intent (creates dangling nodes); if you must, create the stub immediately

## Voice — when drafting content for the user

(Only applies if the user is using the content module in `50 Content/`.)

Drafting for LinkedIn/Twitter/TikTok? Read these first:

- `50 Content/Brand/Voice formula.md` — the user's four-filter test
- `50 Content/Brand/Pre-publish gate.md` — every draft must pass
- `50 Content/Brand/Vocabulary.md` — words the user uses, words they don't
- `80 Areas/Identity/Core/Who I am.md` — the integrating narrative

**Anti-patterns to refuse** (universal across users):
- Hustle-grindset clichés
- LinkedIn motivational poetry
- Performative vulnerability without earned specificity
- Emoji walls
- "Thoughts?" sign-offs

**Anti-AI cadence — non-negotiable.** Content for any user must not sound AI-written. Audience detection happens in 2 sentences and collapses content credibility on contact. Per-post hard caps:

- **Em dashes:** 0 or 1, never 2+
- **Mirror inversions** ("X didn't do A. They were A."): 0 or 1, never 2+
- **Tricolons** (lists of three): 0 or 1, never 2+
- **Wisdom-reveal openers / closers:** 0. Includes "Here's what I didn't expect:", "What I didn't expect was that X", "Turns out X was the whole reason Y", "The lesson is X", "It comes down to X". AI cannot resist closing the loop; resisting closure is the most reliable single signal of a human.
- **Colon-followed-by-list setups:** 0
- **Hyper-parallel sentences** (3+ consecutive with identical syntactic shape): 0
- **Banned AI vocabulary:** delve, tapestry, navigate (abstract), leverage (verb), nuanced, multifaceted, seamless, paradigm, unlock (abstract), realm, journey (metaphor), embrace (metaphor), foster, robust (non-technical), holistic
- **Banned journalistic clichés:** "the thinking goes", "as the saying goes", "or so they say", "the conventional wisdom is", "in a sense", "it could be argued", "one might say", "so to speak", "if you will"

**The read-aloud test:** if it sounds like a TED talk, LinkedIn ghostwriter, or polished newsletter, it's AI. If it sounds like a slightly thoughtful pub conversation — rough edges, natural pauses, the occasional fragment — it's not. When in doubt, read paragraph 1 out loud.

**The Pinterest test:** no sentence in the post should work printed over a sunset on a Pinterest meme. If one would, cut it.

Full rules in `50 Content/Brand/Pre-publish gate.md` under "Anti-AI tells".

## Common operations

### Capture
Drop into `00 Inbox/` with minimal frontmatter (`type: capture, source: voice|chat|web`). Don't process while capturing. Weekly ritual graduates Inbox items into Atoms.

### Create an atom
1. Pick subfolder: Concept / Belief / Moment / Quote / Observation
2. Filename: prose, sentence-cased, no dates ("Consistency beats intensity.md")
3. Use the `_Meta/Templates/Atom.md` template
4. Link to related atoms with `[[ ]]`; tag with `themes:` so it surfaces in the theme Maps under `30 Maps/`

### Import a source
1. `40 Sources/{Books,Articles,Talks,Podcasts}/`
2. Filename = clean title (no `#`, no `/`, no `|`)
3. Use the matching `_Meta/Templates/Source-*.md` template
4. `authors:` as plain strings; rating optional; status one of `to-read | reading | read | abandoned | reference`

### Distill an atom from a source
After reading: extract one *insight* (not a highlight) per atom. Place in `20 Atoms/`. Backlink the Source. The insight lives separate from the source — don't confuse the two.

## Don't do

- ❌ Edit auto-generated files (`_Meta/Bases/*.base` should be edited via the Bases UI, not by hand)
- ❌ Put wikilinks inside YAML frontmatter (use plain strings)
- ❌ Add `#tags` inside note bodies — use `tags:` in frontmatter for queryability
- ❌ Create deep folder hierarchies — flatter is better, MOCs handle navigation
- ❌ Append-and-forget on existing notes — atoms get *refined*, not bloated
- ❌ Use Dataview when Bases covers the need (Bases is GA, Dataview is plugin-locked)
- ❌ Touch `99 Archive/` unless asked
- ❌ Bulk-restructure top-level folders (committed for ≥12 months per the architecture decision)

## Templates and Bases

- Templates: `_Meta/Templates/` (18 templates, one per type)
- Bases views: `_Meta/Bases/` (17 saved queries: reading boards, content boards, people follow-ups, recent seedlings)
- Schema reference: `_Meta/Schema.md`
- Workflow reference: `_Meta/Workflows.md` (weekly processing ritual lives here)
- Plugin list: `_Meta/Plugins.md`
- Backup strategy: `_Meta/Durability.md`

## Working state

- `.claude/scratch/` — your working notes for in-progress tasks (gitignored)
- `.claude/skills/` — repeatable personal skills the user can extend
- `00 Inbox/` — the user's drop zone (not yours). Process to Atoms during weekly ritual.
- `10 Daily/{today}.md` — append observations to today's daily note if asked to log something timely

## Quality bar

Same standard as a well-run repo: **atomic, dense, lean, no half-finished stubs.** If you can't write the note properly, ask before stubbing. Linking is more valuable than writing — a new atom with 3 strong `[[ ]]` outbound links beats a longer one with none.

## Git

If the user has set up the optional GitHub backup, the vault is a private repo (Obsidian Git plugin auto-commits hourly). If you make a batch of changes worth a discrete commit message, you can commit explicitly — use conventional commit style with sentence case:

```
add: 4 atoms on compounding from today's reading
fix: dangling wikilinks in the philosophy theme map
refactor: split Identity/Core notes into atomic files
```
