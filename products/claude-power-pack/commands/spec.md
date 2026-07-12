---
description: Turn a vague idea or feature request into a precise, implementation-ready spec.
---

The user has described something they want built, but it's underspecified: $ARGUMENTS

Your job is to turn this into a spec precise enough that an implementer (human or agent) could
build it without needing to ask a single clarifying question mid-build. Do not start implementing
anything — this command produces a spec document, not code.

## Step 1 — Read before asking

Before asking the user anything, check what you can determine yourself:

- Search the codebase for related existing patterns, similar features, or naming conventions
  this should follow.
- Check for existing types/schemas/models this would touch or extend.
- Note any constraints already implied by the codebase (framework, existing API shapes, existing
  auth patterns) — the spec should follow these, not invent new conventions.

## Step 2 — Identify the real ambiguities

List out loud (to yourself) what's actually unclear versus what you can reasonably infer. Common
gaps to check for:

- **Inputs**: exact shape, required vs optional fields, validation rules, size/rate limits.
- **Outputs**: exact response shape, error format, status codes.
- **Edge cases**: empty state, not-found, duplicate, concurrent modification, permission denied.
- **Scope boundary**: what's explicitly OUT of scope for this pass (important — prevents scope
  creep during implementation).
- **Success criteria**: how will anyone know this is done and correct?
- **Non-functional constraints**: performance expectations, backward compatibility, migration
  needs for existing data.

## Step 3 — Ask only what you couldn't infer

If there are genuine ambiguities that materially change the implementation (not stylistic
preferences), ask the user 2-4 pointed questions — not a 15-item questionnaire. If you can make
a reasonable, low-risk, conventional assumption instead, do that and state the assumption in the
spec rather than blocking on a question.

## Step 4 — Produce the spec

Output in this format:

```
# Spec: <feature name>

## Goal
One or two sentences: what this achieves and for whom.

## Out of scope
Explicit list of adjacent things this does NOT cover.

## Behavior
Precise description of what happens for each input/action, including:
- Happy path
- Each edge case identified in Step 2, with the expected behavior

## Interface
Exact function signatures / API routes / types / schemas involved. Use real names that match
existing codebase conventions.

## Acceptance criteria
A checklist of concrete, testable statements. Each one should be answerable yes/no by running
something, not by opinion.

## Assumptions made
Anything inferred rather than confirmed, so the implementer or reviewer can flag if wrong.

## Suggested implementation notes (optional)
Only include this if there's a non-obvious detail (existing helper to reuse, gotcha to avoid)
worth flagging — do not use this section to sneak in scope beyond what's specified above.
```

This spec should be handoff-ready: precise enough that `executor` (or any competent engineer)
could implement it correctly on the first pass.
