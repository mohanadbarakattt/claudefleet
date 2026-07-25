# 03 — The Delivery Engine

This is where the business either works or falls apart. A great offer with sloppy delivery gets you a one-time client and a bad review. This chapter gives you the actual workflows: prompt chains per lane, a mandatory quality-control pass, a file system, and turnaround targets.

## The core rule: never send raw AI output

Claude is your first-draft engine, not your final-draft engine. Every single deliverable goes through a human review pass before it reaches a client — no exceptions, no "this one looks fine so I'll skip it." The businesses that get bad reviews and lose clients are the ones that treat Claude's first output as done. The businesses that scale are the ones with a repeatable QC step between generation and delivery.

## Prompt chains by lane

A prompt chain is a sequence of prompts, not one giant prompt. Each step has a narrow job, so you can inspect and correct the output before it feeds the next step.

**Lane 1 — Freelance services (example: LinkedIn ghostwriting)**
1. *Intake*: Feed Claude the client's past 10 posts, bio, and target audience notes. Ask it to extract voice patterns (sentence length, tone, recurring phrases, topics avoided) as a bullet list — not a post yet.
2. *Topic list*: Ask for 15 post topic ideas based on the client's stated goals and industry, each with a one-line angle.
3. *Draft*: For each approved topic, ask Claude to draft a post matching the voice profile from step 1, in the client's typical length.
4. *Tighten*: Second pass — ask Claude to cut the draft by 20% and remove any generic AI phrasing ("in today's fast-paced world," "let's dive in," excessive em-dashes and rhetorical questions).
5. *Human pass*: You read every post aloud. If it doesn't sound like a person you could picture, rewrite the offending lines yourself.

**Lane 1 — Freelance services (example: research-to-brief)**
1. *Extraction*: Paste raw notes/transcripts. Ask Claude to extract only factual claims, decisions made, and open questions — no interpretation yet.
2. *Verification prompt*: Ask Claude to flag anything in its extraction that it inferred rather than found explicitly stated in the source. This step exists specifically to catch fabrication before it reaches a client.
3. *Structure*: Ask for the one-page brief format (context, decision, next steps, open questions) using only the verified extraction.
4. *Human pass*: Cross-check every factual claim in the final brief against the source material. This is non-negotiable for research work — a single invented fact destroys trust permanently.

**Lane 2 — Digital products**
1. *Outline*: Ask Claude for a full structural outline before any content generation — chapters, sections, what each must accomplish.
2. *Section drafts*: Generate one section at a time, feeding back the previous section for consistency of voice and terminology.
3. *Gap check*: Ask Claude to review the full draft and flag any claim that needs a source, any inconsistency between sections, and any section under the target density.
4. *Human pass*: Read the whole thing start to finish as a buyer would, once, before shipping.

**Lane 4 — Local business services (example: review responses)**
1. *Context feed*: Give Claude the business's tone guidelines (or 5 examples of how the owner naturally talks) plus the review text.
2. *Draft response*: Ask for a response addressing the specific point in the review, not a generic template.
3. *Human pass*: Read for tone-deafness — this is the step that catches a response that's technically fine but would embarrass the business owner if a customer felt mocked or dismissed.

## The QC checklist (run this on every deliverable, every time)

- Does this contain any fact, number, or claim that isn't verifiable from the source material or client input? If yes, cut it or flag it to the client as unverified.
- Does this sound like a generic AI wrote it (stock phrases, uniform sentence rhythm, hedging language)? If yes, rewrite the flagged sections by hand.
- Does this match the specific result promised in the offer — not just "content," but the outcome the client is paying for?
- Would I be comfortable if the client read this back to me on a call?
- Is the format exactly what was scoped (length, structure, file type)?

If any answer is no, it doesn't go out. Build this into muscle memory before you take on volume — it's the difference between a business and a liability.

## File and folder system

Keep it boring and consistent. One structure per client, reused every time:

```
/clients/[client-name]/
  01-intake/        (their raw material: notes, brand docs, past examples)
  02-drafts/        (Claude output, unedited)
  03-final/         (post-QC, ready to send)
  04-sent/          (dated copies of what was actually delivered)
  contract-and-scope.md
  invoices/
```

Naming convention for files: `YYYY-MM-DD_deliverable-name_v1.md` (increment v2, v3 on revisions). This matters more than it sounds — six months in, you will not remember which draft was the one you sent, and a client asking "can you resend what you sent last month" should take 10 seconds, not 10 minutes.

## Turnaround targets

Set a turnaround you can hit under normal conditions, and beat it slightly rather than promise something aggressive and slip. As starting targets, adjust per your own capacity:

- Small deliverables (single post, single response, single brief): 24–48 hours.
- Medium deliverables (a batch of 8–12 items, a short document): 3–5 business days.
- Large deliverables (a full digital product draft, a multi-page audit): 1–2 weeks, broken into visible milestones so the client sees progress, not silence.

Undersell and overdeliver on time, every time. A client who expected 5 days and got it in 3 tells other people. A client who expected 3 days and got it in 5 does not.
