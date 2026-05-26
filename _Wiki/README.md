# _Wiki — LLM-curated wiki layer (deferred)

Empty scaffold for an opt-in future feature: a Claude-maintained markdown wiki on top of immutable sources.

## What this is (when you opt in)

Karpathy's April 2026 *"idea file"* pattern. A wiki with `index.md` + `log.md` navigation, maintained by Claude on top of your `40 Sources/`. You ask questions; Claude consults the wiki + sources and updates the wiki as it learns.

## When to opt in

Once `40 Sources/` crosses ~100 documents. Below that, the wiki is overhead without payoff. Above that, it becomes a useful retrieval surface.

## How to opt in (when ready)

Future skill: `.claude/skills/wiki-init.md`. Not in v1 of the template.

For now: leave this folder alone. The `.gitkeep` ensures it stays in version control.
