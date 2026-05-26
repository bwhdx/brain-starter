---
name: grade
description: Grade a content draft against the full brand stack — voice formula, pre-publish gate, brand bible, pillar recipe, identity alignment, and anti-AI cadence. Returns an 11-dimension rubric with score, verdict, and specific lift opportunities with proposed rewrites.
---

# /grade — content audit against the brand bible

You are auditing one or more content drafts against the full brand stack. This goes beyond the pre-publish gate (which is the *minimum* bar) into deeper brand-bible alignment.

> **Scope:** dimension 11 (anti-AI cadence) applies to **all writing in the brain**, not just shipping content. Atoms are voice DNA — any post drawn from an AI-cadenced atom inherits the cadence. When a user asks to grade an atom, run dim 11 in full; dimensions 4 (pillar) and 6 (channel fit) are skipped for atoms, but everything else applies.

> **Critical:** the metric the brand bible names (§22) is *"inbound quality, reputational capital, optionality, joy — not followers."* Grade for *quality engagement from the right audience*, not viral reach. A post that would go viral but doesn't earn the right inbound scores lower than a quieter post that brings in two thoughtful founder DMs.

## What to ask first

If the user hasn't named the draft(s), ask:
- *"Which draft path(s)?"* (or *"all drafts in `50 Content/Drafts/`"* for a sweep)

If multiple, grade each separately and produce a comparison table at the end.

## Read context (once per session)

In this order, fully:

1. `50 Content/Brand/Voice formula.md`
2. `50 Content/Brand/Pre-publish gate.md`
3. `50 Content/Brand/Pillars.md`
4. `50 Content/Brand/Vocabulary.md`
5. `50 Content/Brand/Channels.md`
6. `80 Areas/Identity/Core/Brand bible.md`
7. `80 Areas/Identity/Core/Why.md`
8. `80 Areas/Identity/Core/Mission.md`
9. `80 Areas/Identity/Core/Values.md`
10. The draft itself + its seed file + any source atoms referenced

## The 11-dimension rubric

| # | Dimension | Max | What it measures |
|---|-----------|-----|------------------|
| 1 | Voice formula | 4 | The user's four-filter test — one point each |
| 2 | Pre-publish gate — Five Tests | 5 | Two-Year / Mission / Real / Mate / Pub |
| 3 | Voice principles | 8 | Plain-spoken / show-not-label / regional-idiomatic / confident-not-certain / honest-about-not-knowing / warm-collegial / acknowledge-before-redirect / first-person |
| 4 | Pillar recipe | 6 | Specific to the chosen pillar |
| 5 | Vocabulary | 4 | Signature phrase present / regional-cultural texture present / banned absent / "honestly" handled correctly |
| 6 | Channel fit | 7 | Hook stands alone / line breaks / no hashtags-emoji / no "thrilled to announce" / no engagement bait / length in range / leads with thing not feeling |
| 7 | Mental model anchor | 2 | 0 = none / 1 = implicit / 2 = explicitly named (from the user's brand bible §10 mental models list) |
| 8 | Identity alignment | 5 | Why ✓ / Mission ✓ / Values (load-bearing 3) ✓ / Ten roles touched ✓ / not violating any of the above ✓ |
| 9 | Performance signals | 10 | Hook strength / quotable line present / shareability for target audience / earns the read / does NOT optimise for viral over inbound quality |
| 10 | Loved/Against alignment | 8 | 1pt per "loved" thing present (max 4) + 1pt per "against" thing absent (max 4) |
| 11 | **Anti-AI cadence** | 8 | The most important dimension — see below |

**Total possible: 67 points.**

### Dimension 11 — Anti-AI cadence (8 points)

The cadence test. AI-written content is detectable within 2 sentences regardless of substance. If this dimension fails, the post fails the gate regardless of other scores.

Score 1 point per check passed (pattern absent or within cap):

- [ ] **Em dashes** — count is 0 or 1 (NOT 2+)
- [ ] **Tricolons** (lists of three) — count is 0 or 1
- [ ] **Hyper-parallel sentences** — no 3+ consecutive sentences with identical syntactic shape
- [ ] **Wisdom-reveal openers / closers** — zero "Here's what I didn't expect:", "What I didn't expect was that X", "Turns out X was the whole reason Y", "What I learned: X", "The lesson is X", "It comes down to X"
- [ ] **Mirror inversions** ("X didn't do A. They were A.") — count is 0 or 1
- [ ] **Colon-followed-by-list setups** — count is 0
- [ ] **Banned AI vocabulary absent** — delve / tapestry / navigate (abstract) / leverage (verb) / nuanced / multifaceted / seamless / paradigm / unlock (abstract) / realm / journey (metaphor) / embrace (metaphor) / foster / robust (non-technical) / holistic
- [ ] **Banned journalistic clichés absent** — "the thinking goes" / "as the saying goes" / "or so they say" / "the conventional wisdom is" / "in a sense" / "it could be argued" / "one might say" / "so to speak" / "if you will"
- [ ] **Read-aloud test** — first paragraph AND closer sound like spoken-user, NOT TED-talk / LinkedIn-ghostwriter / polished-newsletter cadence. **Pinterest test:** no sentence in the post would work printed over a sunset on a Pinterest meme.

**Critical thresholds (hard failures, regardless of point total):**
- More than 2 em dashes → automatic dimension fail (set to 0/8)
- More than 1 mirror inversion → automatic dimension fail
- Any banned AI vocabulary present → automatic dimension fail
- Any tied-bow wisdom sentence (lesson-announcing closer or "what I didn't expect was that X" opener) → automatic dimension fail
- Read-aloud test obvious AI → automatic dimension fail

If dimension 11 fails, **do not mark the post ready regardless of other scores.** Surface the specific tells with quoted text and propose anti-AI rewrites.

## Grade bands

- **A (90%+)** — ship immediately, don't tinker
- **A- (85–89%)** — ship, with 1–2 optional lifts noted
- **B+ (80–84%)** — apply lifts before shipping
- **B (75–79%)** — material gap, rewrite the failing dimension(s)
- **C or below** — shelf or significantly rework

**Override:** if dimension 11 (anti-AI cadence) scores below 5/8 OR triggers any critical-threshold hard failure, the post **cannot** be graded above B regardless of other dimensions. AI-cadenced content collapses the brand's §22 metric (inbound quality) the moment it's read.

## Output format

For each draft, return:

```
GRADE — {channel}: {filename}

The post (quoted):
> {full post text}

| # | Dimension | Score | Note |
|---|-----------|-------|------|
| 1 | Voice formula | 4/4 | All four pass |
| 2 | Pre-publish gate | 5/5 | All five tests pass |
| ... | ... | ... | ... |
| 11 | Anti-AI cadence | 8/8 | em dashes 0, mirrors 1, tricolons 1, no wisdom-reveals |

**Total: {x}/67 = {pct}% = {grade}**

### Strengths
- {2-4 bullets, specific, with quoted text}

### Lift opportunities (specific, with proposed text)
1. {dimension affected} — current: "{quote}" — proposed: "{rewrite}" — why: {reason}
2. ...

### Verdict
{Ship / Ship with lifts / Apply lifts then ship / Rewrite / Shelf}
```

If multiple drafts, end with:

```
COMPARISON

| Draft | Channel | Grade | Verdict |
|-------|---------|-------|---------|
| ... | ... | ... | ... |
```

## Tone in your own output

- Be ruthless on dimensions 1-4 and 11. They're the discipline. Don't grade-inflate.
- Be honest on dimension 9. If a post would go viral but bring the wrong audience, score lower not higher.
- Don't pad with "this is great" — the user has read the work. Name what's strong and what's not, briefly.
- Suggest specific rewrites with the actual text, not "consider tightening this section".

## When to push back / refuse

- **If the user asks to grade leniently** to ship something they want shipped — refuse. The grading exists to protect them from drift.
- **If a draft has the voice formula failing on "earned"** — say so plainly and recommend a different atom rather than walking the rest of the rubric.

## After grading

If verdict is *"Apply lifts then ship"* and the user agrees:
- Update the draft file with the lifts
- Update frontmatter: `grade: {letter}`, `grade_breakdown: "{1-line summary}"`, `revised: {date}`
- Re-run dimensions 1–6 and 11 to confirm the lifts didn't break anything else

If verdict is *"Ship"*:
- Update frontmatter: `grade: {letter}`, `grade_breakdown: "{1-line summary}"`
- Confirm status: ready

## Skip / fast modes

- *"grade quickly, no detail"* — just return the table + total + verdict, skip strengths/lifts
- *"grade only dimensions 1-6 and 11"* — the writing-discipline subset, skip identity/performance/loved-against
- *"sweep all drafts"* — grade every file in `50 Content/Drafts/{channel}/`, return a comparison table sorted by grade desc, then full details for any scoring < A-
