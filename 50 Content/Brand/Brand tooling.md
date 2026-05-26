---
type: area
domain: content
created:
---

# Content/Brand — operational content tooling

The *identity* lives in `80 Areas/Identity/`. This folder is the operational tooling for shipping content well.

## How to ship a piece of content

- **[[Content process]]** — the canonical 6-step flow: pick → seed → shape → draft → gate → ship. Open this when sitting down to make content.
- **[[Cadence]]** — how often, when, how it fits into the weekly rhythm.
- **`.claude/skills/draft.md`** — the same process codified as a Claude skill. Run `/draft` to invoke it end-to-end.

## The discipline

- [[Voice formula]] — the four-filter test that gates every draft (defaults to *earned + specific + quiet + brief*; you customise during setup)
- [[Pre-publish gate]] — the five tests + the anti-AI cadence rules
- [[Vocabulary]] — your signature openers, recognition words, banned phrases
- [[Pillars]] — what you write about (you fill in 3-5 during setup)
- [[Channels]] — LinkedIn / Twitter / TikTok / other format conventions

## The loop, in one line

`Atom → Bank/ (raw → shaped) → Drafts/{channel}/ (draft → ready) → Published/ (posted)`. Voice formula at every step; pre-publish gate at the `ready` transition.

## How to populate this folder

If you opted into the content module during `/setup`, all these files are pre-populated based on your answers. If not, run `/setup content` to do just the content module.

If you want to set them up manually, each file in this folder is a template with `[FILL IN]` markers indicating what to replace.

## Quality bar

These docs are operational — they should fit on a single screen each. Updates happen quarterly when you notice a pattern across published posts (e.g., a new banned phrase, a refined voice filter). Don't fiddle weekly.
