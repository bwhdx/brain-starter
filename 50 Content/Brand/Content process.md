---
id: content-process
type: meta
created:
tags: [content, process, workflow]
---

# Content process — atom to ship in 6 steps

The brain holds the raw material. The process turns it into content.

> **Principle:** assemble, don't invent. The atoms are the thinking; the post is a small constellation of atoms shaped for a channel. If you find yourself inventing from scratch, you're skipping the brain — go back to the atom.

## The six steps

| # | Step | Input | Output | Status after |
|---|------|-------|--------|--------------|
| 1 | **Pick** | A direction or a felt urge to say something | One atom (or 2–3 related) named | — |
| 2 | **Seed** | The chosen atom + intent | A seed file in `50 Content/Bank/` | `raw` |
| 3 | **Shape** | The raw seed | One clear idea, pillar chosen, voice partly checked | `shaped` |
| 4 | **Draft** | The shaped seed | A channel-specific draft file in `50 Content/Drafts/{channel}/` | `draft` |
| 5 | **Gate** | The draft | A gated draft — every test passed or every failure rewritten | `ready` |
| 6 | **Ship** | The ready draft | Posted + filed in `50 Content/Published/` + engagement noted | `posted` |

## Step 1 — Pick

Two paths:

- **Opportunistic** — an atom is fresh in your head, or something happened today worth saying. Go with it.
- **Scheduled** — during Sunday review, open the Bases view *"Atoms — Recent seedlings"* and *"Content — Bank seeds"*. Pick one ripe for content.

**Acceptance:** one atom (or 2–3 related) named and held in mind.

## Step 2 — Seed

Create `50 Content/Bank/{YYYYMMDD}-{slug}.md` from `_Meta/Templates/Seed.md`.

Body — one paragraph answering three questions:
1. **What's the thing being said?** (one sentence, plain)
2. **Who's it for?** (a specific kind of person, not "everyone")
3. **Why now?** (what makes this the moment for this post)

## Step 3 — Shape

- **Pick the pillar definitively** — one, not two. See [[Pillars]].
- **State the one clear idea** in one sentence. This is the spine.
- **Voice formula check** ([[Voice formula]]) — for each of your four filters, write one line: does this pass, and why?

Update frontmatter: `status: shaped`, `voice:` listing the filters that currently pass.

## Step 4 — Draft

Create `50 Content/Drafts/{channel}/{YYYYMMDD}-{slug}.md` from `_Meta/Templates/Draft.md`, one per channel.

Format conventions in [[Channels]]:

- **LinkedIn** — 150–400 words; hook line first; no hashtags; one clear idea
- **Twitter** — single tweet ≤280 chars **OR** thread of 3–7 standalone-readable tweets
- **TikTok** — 30–90 second script; point first; no walk-in build

Draw on the atom's language. Use [[Vocabulary]]'s preferred words; avoid the banned ones.

## Step 5 — Gate

Open [[Pre-publish gate]]. Walk it in order:

1. **The Five Tests** — Two-Year, Mission, Real, Mate, Pub. Any failure here is a kill or rewrite.
2. **Voice fingerprint** — short sentences, idiomatic, plain words, specific over generic, first-person.
3. **Banned constructions** — no banned vocabulary, no performative-honesty openers, no engagement-bait closers, no emoji, no hashtags.
4. **Anti-AI cadence** — em dash count, mirror inversion count, tricolons, wisdom-reveals, journalistic clichés. Read paragraph 1 out loud.
5. **Substance** — one idea, anchored in a specific decision or moment.
6. **Tone & format** — confident not certain, no punching down, within channel limits.

When **all pass**: update frontmatter — `status: ready`, `voice: [all filters]` checked.

**If any fail:** do NOT mark `ready`. Surface failures with proposed rewrites.

## Step 6 — Ship

- Post on the channel (manually — neither the brain nor Claude posts on your behalf).
- Move the draft file from `Drafts/{channel}/` to `Published/`.
- Update frontmatter: `status: posted`, `posted_at: {date}`, `posted_url: {permalink}`.
- **A week later:** open the note, add `## Engagement notes` section.

## With Claude — the codified version

Run `/draft` to invoke this entire flow. Claude:

1. Asks which atom + which channel(s)
2. Reads the atom + voice formula + brand bible + pillar + 2–3 recent published posts (for tone calibration)
3. Drafts the seed
4. Shapes the seed
5. Drafts per channel
6. Runs the gate, surfaces failures
7. Returns: seed path, draft path(s), gate audit, status

You review. Push back on anything that doesn't sound like you. Iterate until `ready`. Ship manually.

Skill at `.claude/skills/draft.md`.

## When to shelf vs. ship

**Shelf when:**
- The atom is borrowed wisdom, not earned
- The "specific moment" doesn't exist or is too private to share
- You're reaching for a take — quiet test fails repeatedly
- The pre-publish gate keeps failing after 3 rewrites
- You'd be embarrassed to see this in 2 years

**Ship when:**
- All four voice filters check honestly (no rationalisation)
- All five gate tests pass without fudging
- The pub test passes: you'd say this in real conversation
- You'd be happy with it in 2 years
