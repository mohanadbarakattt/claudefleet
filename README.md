# ClaudeFleet — digital product business in a box

Built 2026-07-12, rebranded + expanded 2026-07-12. Everything needed to sell
digital products to Claude/AI users via Instagram reels → comment keyword →
automated DM → storefront. Formerly "ClaudeStack" — renamed to ClaudeFleet
because the flagship new product is about deploying a *fleet* of AI agent
employees, and `claudefleet.com` is available to register (verified via whois,
standard non-premium pricing).

## What's here
- `products/claude-power-pack/` — $19: 5 subagents + 7 slash commands + CLAUDE.md template
- `products/prompt-vault/` — $27: 50 money-making prompts w/ pricing angles
- `products/claude-money-os/` — $39: 8-chapter business playbook + 90-day plan
- `products/claudefleet-machines/` — **$97, new premium tier**: 3 done-for-you AI businesses
  (Content & Growth Agency, Lead-Gen & Outreach, Digital Product Launch), each with its own
  playbook, 4 AI agent employees (12 total), a marketing/outreach system to land clients, a
  `requirements.md` naming every external subscription needed (Higgsfield, Apollo.io, Resend,
  Airtable, Calendly, Gumroad — with "verify current pricing yourself" language, never invented
  numbers), and a setup checklist. Adversarially reviewed (3-agent audit, avg ~8.3/10) — fixes
  applied: an explicit "don't buy this if you have zero audience" qualifier on the product-launch
  machine, a video-generation fallback path on the two machines that lean on Higgsfield, a
  GDPR/CAN-SPAM legal note on the lead-gen machine, and rough (heavily-caveated) monthly cost
  ballparks in every requirements doc.
- `site/index.html` — visual dark marketplace landing page (bundle $129): SVG fleet logo,
  feature grid, live terminal-style product mockup, 4 product cards including the premium
  Machines tier with a visible "Needs: Higgsfield / Apollo.io / Resend / Gumroad / Claude Code"
  requirements strip, "Built With This Approach" portfolio section (generalized case studies),
  honest empty-slot reviews section (no fabricated testimonials), expanded FAQ, footer
  disclaimer ("not affiliated with/endorsed by Anthropic")
- `site/logo.svg` — refined "fleet in echelon formation" mark (three forward chevrons), also
  used as favicon
- `marketing/reel-scripts.md` — 6 IG reel scripts (hook/plot/payoff/CTA keywords, incl. Reel 6/FLEET)
- `marketing/higgsfield-prompts.md` — 24 scene prompts (4 per reel), consistent style
- `marketing/dm-automation.md` — ManyChat comment→DM setup + DM copy (6 keywords)
- `marketing/market-research.md` — real sourced research (audience segments, working content
  formats, top objections + counters, Claude-specific niche opportunity) — figures flagged
  where the primary source couldn't be confirmed, nothing invented
- `marketing/content-system.md` — the content engine's spec: 3 recurring characters (The
  Operator, Ava the AI-guide, Skeptic/Client dramatized roles), 9 format pillars, CTA keyword
  map, and the compliance rules (no fake urgency, no fake income/bank-balance screenshots, no
  testimonial misrepresentation) every calendar day follows
- `marketing/calendar/` — the full 30-day content calendar (week-1.md through week-4.md, start
  at calendar/README.md), one entry per day: hook, beats, a screen-record instruction or ready
  Higgsfield-style AI video prompt, a ready-to-post caption, and a CTA keyword. Scanned for
  compliance violations after writing — none found.
- `dist/` — zipped products ready to upload to Gumroad (`claudefleet-full-bundle.zip` is all 4)

## Live / shipped
- GitHub: https://github.com/mohanadbarakattt/claudefleet (renamed from claude-goods; local
  remote already updated, `git push` works as normal)
- Deployed: https://site-delta-hazel-30.vercel.app (redeployed after rebrand + new product)

## needsUser (things only you can do — accounts/payments/domain/publishing)
1. **Domain**: `claudefleet.com` was available at last check (whois, 2026-07-12) — register it
   yourself at a registrar of your choice; domain availability and pricing can change, so
   re-verify before paying. Point it at the Vercel deployment once registered.
2. **Gumroad** (or LemonSqueezy — better for Egypt payouts, check both support your bank/Payoneer):
   upload the 5 zips from `dist/` (4 products + bundle), set prices $19/$27/$39/$97/$129,
   enable discount pricing display.
3. Replace in `site/index.html`: `GUMROAD_LINK_POWER_PACK`, `GUMROAD_LINK_PROMPT_VAULT`,
   `GUMROAD_LINK_MONEY_OS`, `GUMROAD_LINK_MACHINES`, `GUMROAD_LINK_BUNDLE`, and `FORM_ENDPOINT`
   (free form endpoint: formspree.io or Gumroad's follow form).
4. **Deploy site**: already deployed once via `npx vercel --prod` (see Live/shipped above). For
   auto-deploy on every future push, link the repo in the Vercel dashboard (Import Project →
   pick this repo → Root Directory: `site`). Otherwise redeploy manually from `site/`.
5. **ManyChat**: 20-min setup per `marketing/dm-automation.md` (needs your IG + FB logins).
6. **Film/generate content**: you now have two content sources — the original 6 short reel
   scripts in `marketing/reel-scripts.md` (post order 5→1→2→3→6→4) for a quick launch burst, and
   the full `marketing/calendar/` 30-day plan for sustained daily posting. Every "screen-record"
   note needs a real recording of your actual site/product — don't fake these (see
   `calendar/README.md`). Every AI-video note is a ready Higgsfield prompt.
7. **Cast the recurring characters**: Ava (AI-guide), Skeptic, and Client are written as roles,
   not scripts for a specific person — use an AI-avatar tool, a friend, or play them yourself.
   Keep the compliance framing intact if you rewrite lines.
8. **Real reviews**: the site ships with 3 honest "no reviews yet" placeholder cards
   (`#reviews` section in `site/index.html`) instead of fake testimonials. As real buyers
   send feedback, replace the `.t-empty` cards with real `.t-card` quotes + first name + role
   (get permission before publishing anyone's words).
9. **"Built With This Approach" section**: generalized capability showcases (autoposter, career
   advisor, orchestration OS, etc.), written as proof-of-concept, not as claims about specific
   existing products. Swap in real live project names/URLs if you want, only ones you're
   comfortable making public.
10. **Machines pricing is unverified against your actual costs**: the $97 price assumes buyers
   already run or are willing to sign up for Higgsfield/Apollo/Resend-type tools. If you want to
   test a lower-commitment price point before the $97 tier, that's a pricing call only you should
   make — nothing in the copy locks you into $97.

## Honesty notes (baked into the copy)
- No income claims anywhere — copy sells the system, not fake results.
- No fabricated testimonials — reviews section is honestly empty until real ones arrive.
- No fabricated tool pricing — every requirements.md points to "verify at the vendor's page,"
  with only heavily-caveated rough ballparks for budgeting, never presented as fact.
- Refund promise is in the site FAQ — honor it on Gumroad (enable refunds).
- "First 50 comments get the discounted price" in Reel 2 — actually configure a
  Gumroad discount code with 50 uses, or cut that line.
- Footer includes an explicit "not affiliated with/endorsed by Anthropic" disclaimer — keep it
  if you ever revise the copy; using "Claude" in a product name works better with that disclaimer
  present than without it.
