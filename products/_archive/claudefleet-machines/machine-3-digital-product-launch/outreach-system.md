# Launch Marketing System

This is the structure marketer.md fills with product-specific copy every launch cycle. Don't
redesign this each time — reuse the structure, swap the specifics.

## The 5-email sequence

Send via Resend (or whatever ESP the operator already uses — see requirements.md). Timing below
is the default; compress to 3-4 days if the list is small and warm, stretch to 10-14 days if
building a cold list from scratch.

**Email 1 — Pre-launch / problem-agitation (send ~7 days before launch)**
- Subject: names the problem, not the product ("Still doing X the slow way?").
- Body: describe the specific pain the product solves, using language the target buyer would use
  about themselves — not marketing language about the product. No pitch yet, no link to buy.
- CTA: none, or a soft "reply and tell me if this is you" to build engagement/signal.

**Email 2 — Pre-launch / announce it's coming (send ~3-4 days before launch)**
- Subject: announces the product exists and is coming, with the launch date.
- Body: one-line promise, who it's for, why now (what prompted building it — ties back to the
  validated problem from researcher.md). Mention early-bird pricing or launch-week price if real.
- CTA: "Reply if you want early access" or a waitlist link if the operator has one set up.

**Email 3 — Launch day (send the morning of launch)**
- Subject: direct and clear — the product name and the core promise, no cleverness that obscures
  what's being sold.
- Body: what it is, exactly what's included, the price, who it's for (and who it's NOT for — this
  increases trust and reduces refunds). One real specific detail from the actual content.
- CTA: buy link, front and center, repeated once more at the bottom.

**Email 4 — Launch week / objection handling (send 2-3 days after launch)**
- Subject: addresses the most likely hesitation directly (price, time-to-implement, "will this
  actually work for me").
- Body: answer the objection honestly, reference any real early buyer feedback if it exists (never
  invented), restate the promise.
- CTA: buy link again, note if launch pricing is ending soon (only if genuinely true).

**Email 5 — Post-launch / last call + what's next (send at close of launch window, e.g. day 5-7)**
- Subject: signals this is the last call for launch pricing (only if real), or wraps the launch
  and teases what's next in the catalog.
- Body: final CTA for stragglers, plus a soft tease of next month's product to keep the list warm
  between launches — this is where the catalog effect starts compounding.
- CTA: buy link, or for non-buyers, an invite to stay on the list for what's next.

## 3 social post templates

**Template A — Problem-agitation** (use pre-launch, ~5-7 days out)
"If you've ever [specific version of the pain point], you know [specific frustrating detail].
That's exactly what I built [product] to fix." Ends with a question to drive comments, not a link.

**Template B — Behind-the-scenes / proof** (use mid pre-launch or launch week)
Show one real piece of the actual product (a screenshot, one prompt, one template excerpt) with
a caption explaining why that specific piece exists — grounds the post in something real rather
than a generic "coming soon" teaser.

**Template C — Direct launch announcement** (use on launch day)
Name the product, the promise, the price, and a direct link/CTA. No hedging, no burying the ask —
launch day posts should read as confidently as the launch email.

## ManyChat comment-to-DM automation (optional layer)

This is an optional automation that plugs into the launch-day social post — explained here from
scratch since the operator may not have used it before.

**The pattern:** ManyChat watches a specific social post (Instagram/Facebook/TikTok) for comments
containing a trigger word (e.g. "SEND ME" or the product name). When someone comments the trigger
word, ManyChat automatically sends them a DM with the buy link — no manual DM-ing required, and it
scales past what a person could message manually.

**How it plugs into this system:**
1. Post Template C (direct launch announcement) with an explicit instruction: "Comment [TRIGGER
   WORD] and I'll send you the link."
2. Set up a ManyChat automation (built in ManyChat's own flow builder) watching that specific
   post for the trigger word in comments.
3. ManyChat auto-DMs the commenter with a short message + the buy link.
4. Optionally, ManyChat can also auto-reply to the comment itself (e.g. "Sent! Check your DMs 📬")
   which increases comment volume via social proof, since new viewers see other people already
   engaging.

**Why bother instead of just putting the link in the post:** platforms often suppress reach on
posts with outbound links in the caption; the comment-trigger pattern keeps the post link-free
(better reach) while still delivering the link via DM to everyone who's interested.

Verify current ManyChat plan requirements and setup steps at ManyChat's own documentation/pricing
page before setting this up — flow-builder UI and plan limits change over time.
