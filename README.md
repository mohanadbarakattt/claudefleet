# ClaudeStack — digital product business in a box

Built 2026-07-12. Everything needed to sell digital products to Claude/AI users
via Instagram reels → comment keyword → automated DM → storefront.

## What's here
- `products/claude-power-pack/` — $19: 5 subagents + 7 slash commands + CLAUDE.md template
- `products/prompt-vault/` — $27: 50 money-making prompts w/ pricing angles
- `products/claude-money-os/` — $39: 8-chapter business playbook + 90-day plan
- `site/index.html` — visual dark marketplace landing page (bundle $59): SVG logo, feature grid,
  live terminal-style product mockup, "Built With This Approach" portfolio section (generalized
  case studies — automation, coaching, orchestration, no-code, content, ops), honest empty-slot
  reviews section (no fabricated testimonials), expanded FAQ
- `site/logo.svg` — standalone mark, also used as favicon
- `marketing/reel-scripts.md` — 5 IG reel scripts (hook/plot/payoff/CTA keywords)
- `marketing/higgsfield-prompts.md` — 20 scene prompts (4 per reel), consistent style
- `marketing/dm-automation.md` — ManyChat comment→DM setup + DM copy
- `dist/` — zipped products ready to upload to Gumroad

## needsUser (things only you can do — accounts/payments/publishing)
1. **Gumroad** (or LemonSqueezy — better for Egypt payouts, check both support your bank/Payoneer):
   upload the 4 zips from `dist/` (3 products + bundle), set prices $19/$27/$39/$59,
   enable discount pricing display.
2. Replace in `site/index.html`: `GUMROAD_LINK_POWER_PACK`, `GUMROAD_LINK_PROMPT_VAULT`,
   `GUMROAD_LINK_MONEY_OS`, `GUMROAD_LINK_BUNDLE`, and `FORM_ENDPOINT`
   (free form endpoint: formspree.io or Gumroad's follow form).
3. **Deploy site**: connected to GitHub — Vercel auto-deploys on push once you link the repo
   in the Vercel dashboard (Import Project → pick this repo → Root Directory: `site`).
   Or manually: `cd site && npx vercel deploy --prod`.
4. **ManyChat**: 20-min setup per `marketing/dm-automation.md` (needs your IG + FB logins).
5. **Film/generate reels**: Higgsfield prompts are ready; post order 5→1→2→3→4.
6. **Real reviews**: the site ships with 3 honest "no reviews yet" placeholder cards
   (`#reviews` section in `site/index.html`) instead of fake testimonials. As real buyers
   send feedback, replace the `.t-empty` cards with real `.t-card` quotes + first name + role
   (get permission before publishing anyone's words).
7. **"Built With This Approach" section**: currently generalized capability showcases
   (autoposter, career advisor, orchestration OS, etc.) written as proof-of-concept, not as
   claims about specific existing products. If you want to link real live projects there
   instead, swap in actual names/URLs you're comfortable making public.

## Honesty notes (baked into the copy)
- No income claims anywhere — copy sells the system, not fake results.
- No fabricated testimonials — reviews section is honestly empty until real ones arrive.
- Refund promise is in the site FAQ — honor it on Gumroad (enable refunds).
- "First 50 comments get the discounted price" in Reel 2 — actually configure a
  Gumroad discount code with 50 uses, or cut that line.
