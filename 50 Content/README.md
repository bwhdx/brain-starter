# 50 Content — content production (optional module)

This folder is for **personal content production** — drafting posts for LinkedIn, X, TikTok, or any other channel where you publish under your own name.

> **Optional module.** If you don't create public content, you can delete this folder entirely. The rest of the brain works without it.

## Structure

- **Bank/** — raw seeds (status: `raw → shaped`)
- **Drafts/{linkedin,twitter,tiktok}/** — channel-specific drafts (status: `draft → ready`)
- **Published/** — what shipped, with `posted_at` + `posted_url` + engagement notes
- **Brand/** — the operational tooling (voice formula, pre-publish gate, vocabulary, pillars, channels, process, cadence, brand bible)

## The loop

`Atom → Bank/ (raw → shaped) → Drafts/{channel}/ (draft → ready) → Published/ (posted)`

Voice formula at every step; pre-publish gate at the `ready` transition.

See `50 Content/Brand/Content process.md` for the full 6-step flow and `50 Content/Brand/Cadence.md` for the weekly rhythm.

## The killer skill

`.claude/skills/draft.md` is the codified content process. Run it and Claude:
1. Reads the atom you point at
2. Reads your full brand stack (voice formula, pre-publish gate, pillars, vocabulary, channels)
3. Drafts a seed
4. Drafts per channel
5. Runs the pre-publish gate
6. Returns ready-to-ship text

You review and ship manually.
