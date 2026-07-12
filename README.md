# ClaudeStack — digital product business in a box

Built 2026-07-12. Everything needed to sell digital products to Claude/AI users
via Instagram reels → comment keyword → automated DM → storefront.

## What's here
- `products/claude-power-pack/` — $19: 5 subagents + 7 slash commands + CLAUDE.md template
- `products/prompt-vault/` — $27: 50 money-making prompts w/ pricing angles
- `products/claude-money-os/` — $39: 8-chapter business playbook + 90-day plan
- `site/index.html` — dark marketplace landing page (bundle $59)
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
3. **Deploy site**: `cd ~/projects/claude-goods/site && vercel deploy --prod` (or drag folder into Netlify Drop).
4. **ManyChat**: 20-min setup per `marketing/dm-automation.md` (needs your IG + FB logins).
5. **Film/generate reels**: Higgsfield prompts are ready; post order 5→1→2→3→4.

## Honesty notes (baked into the copy)
- No income claims anywhere — copy sells the system, not fake results.
- Refund promise is in the site FAQ — honor it on Gumroad (enable refunds).
- "First 50 comments get the discounted price" in Reel 2 — actually configure a
  Gumroad discount code with 50 uses, or cut that line.
