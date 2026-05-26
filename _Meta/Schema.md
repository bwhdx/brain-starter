---
type: meta
created:
---

# Schema — frontmatter spec for every note type

Every note in the vault has YAML frontmatter. The `type` field is mandatory and drives Bases queries. This doc is the canonical reference for what fields each type uses.

## Universal fields

These can appear on any note:

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Stable identifier, usually `{type}-{timestamp}-{slug}` |
| `type` | enum | One of: `atom \| source \| seed \| draft \| published \| person \| project \| decision \| area \| map \| goal \| daily \| capture \| weekly-review \| meta \| place` |
| `created` | date (YYYY-MM-DD) | When the note was created |
| `tags` | array of strings | Free-form. Lowercase. Plain strings, **not wikilinks** |

## Atom

```yaml
---
id: 20260526-1730-consistency-beats-intensity
type: atom
kind: concept | belief | moment | quote | observation
created: 2026-05-26
status: seedling | budding | evergreen
source: ""              # where it came from — call, conversation, walk
tags: []                # topical only
themes: []              # picks up in 30 Maps/{theme}.md
related: []             # [[Other Atom]] wikilinks worth surfacing
---
```

`status` follows the evergreen progression: **seedling** (just captured), **budding** (refined once), **evergreen** (densely linked, stable).

## Source

```yaml
---
id: source-book-the-structure-of-scientific-revolutions
type: source
kind: book | article | talk | podcast | highlight
title: "The Structure of Scientific Revolutions"
authors: ["Thomas S Kuhn"]
status: to-read | reading | read | abandoned | reference
rating:                 # 1-5, blank if unrated
date_added: 2026-05-26
date_started:
date_read:
read_count: 0
url: ""
# Book-specific
isbn: ""
isbn13: ""
num_pages:
pub_date:
publisher: ""
binding:
cover: ""
shelves: [to-read]
series_name: ""
series_num:
tags: []
---
```

## Seed (content)

```yaml
---
id: seed-20260526-{slug}
type: seed
pillar: <your-pillar>
format: [linkedin, twitter, ...]
status: raw | shaped | posted | shelved
voice: []               # subset of [earned, specific, quiet, brief]
sources: ["[[Atom]]"]   # wikilinks here are OK because they're values not arrays of links
notes: ""
---
```

## Draft (content)

```yaml
---
id: draft-{channel}-20260526-{slug}
type: draft
channel: linkedin | twitter | tiktok
status: draft | ready | scheduled | posted | killed
seed: "[[Seed name]]"
target_date:
voice: [earned, specific, quiet, brief]
char_count:
word_count:
grade:                  # set by /grade skill
grade_breakdown:        # set by /grade skill
---
```

## Published (content)

```yaml
---
id: published-{channel}-20260526-{slug}
type: published
channel: linkedin | twitter | tiktok
posted_at: 2026-05-26
posted_url: "https://..."
seed: "[[Seed name]]"
status: posted
engagement_review_due: 2026-06-02
engagement_notes: ""
voice: [earned, specific, quiet, brief]
word_count:
char_count:
---
```

## Person

```yaml
---
id: person-jane-doe
type: person
name: "Jane Doe"
relationship: family | friend | team | advisee | network
location: ""
employer: ""
role: ""
last_contact: 2026-05-20
follow_up:              # date when you want to reach out
birthday:
tags: []
---
```

## Project

```yaml
---
id: project-q3-launch
type: project
name: "Q3 product launch"
status: planning | active | paused | done | killed
started: 2026-05-26
target_end:
ended:
outcome_metric: ""      # how you'll know it's done
tags: []
---
```

## Decision

```yaml
---
id: decision-20260526-hire-specialist
type: decision
date: 2026-05-26
title: "Hire specialist for X role"
status: open | made | reviewed
confidence: 1-5
revisit: 2026-08-26     # when to look back
chose: ""
alternatives: []
tags: []
---
```

## Area

```yaml
---
id: area-health
type: area
domain: health | travel | reading | identity | philosophy | ...
status: active | dormant
created: 2026-05-26
tags: []
---
```

## Map (MOC)

```yaml
---
id: map-{theme-slug}
type: map
created: 2026-05-26
tags: []
---
```

## Goal

```yaml
---
id: goal-2026-{slug}
type: goal
title: "Goal name"
period: yearly | quarterly
year: 2026
quarter:                # 1-4 if quarterly
status: active | done | abandoned
created: 2026-05-26
target_date:
metric: ""
tags: []
---
```

## Daily, Capture, Weekly-review

Light frontmatter:

```yaml
---
type: daily | capture | weekly-review
date: 2026-05-26
---
```

## Hard rules

1. **`type` is always present.** Bases views break without it.
2. **`tags`, `themes`, `related`, `authors` are plain strings, not wikilinks.** Wikilinks in YAML arrays create dangling graph nodes. Use wikilinks only in note bodies (and singular YAML fields like `seed:`, `source:` where it's a string value not an array).
3. **`status` enums are fixed.** Adding new values breaks Bases filters. If you need a new state, add it here and update the relevant Bases views.
4. **Dates are `YYYY-MM-DD`.** Always. No exceptions.
5. **`id` is stable.** Once assigned, never changes. Filenames can be renamed; `id` is the durable handle.

## When you need a new type

Add it here first. Update the relevant Bases views. Then start writing notes of that type.

Don't invent types on the fly — that's how schemas drift into chaos.
