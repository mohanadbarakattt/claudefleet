# ClaudeFleet — two machines, one engine

A digital-product business in a box. Consolidated **2026-07-25** from four small
products into **two $99 machines** built on a shared engine, with the storefront
reshaped around them.

Repo lives at `~/projects/claude-goods` · GitHub: https://github.com/mohanadbarakattt/claudefleet
Live site: https://site-delta-hazel-30.vercel.app

## What we sell now

| Product | Price | Pipeline | Who it's for |
|---|---|---|---|
| **Autopilot Content Machine** | $99 | IDEA → SCRIPT → RENDER → ASSEMBLE → SCHEDULED | Creators/agencies selling attention |
| **Digital Product Machine** | $99 | VALIDATE → BUILD → PACKAGE → LAUNCH KIT → SCHEDULED | Builders who'd rather own the product |
| **Both machines** | $149 | — | Runs both off one engine |

Both drive the same three services: **Claude** (brain) → **Higgsfield** (media) →
**Postiz** (distribution). That requirement is stated on the sales page *above*
the pricing, not after checkout — see "Honesty rules" below.

## Layout

- `products/_engine/` — **the shared core, ships inside both products.**
  - `admin-panel/index.html` — single-file local dashboard. No build step, no
    network requests, works from `file://`. Kanban pipeline, service status,
    run log, cost tracker, next-action command with copy button, JSON
    import/export, demo data on first open. Verified running in-browser.
  - `ENGINE.md`, `INSTALL.md`, `hooks/`, `pipeline.example.json`
- `products/autopilot-content-machine/` — machine 1 (docs, 18 prompts, 5 skills, 5 agents)
- `products/digital-product-machine/` — machine 2 (same shape)
- `products/_archive/` — the four retired products. Not sold, not listed. The
  genuinely useful parts ship as bonuses inside the machines — see
  `_archive/README.md` for the mapping.
- `site/index.html` — the storefront, rebuilt around the standard high-converting
  landing anatomy: headline → supporting copy → CTA → hero visual → subheading →
  features (with live mini-mockups) → requirements → products → social proof →
  reinforcing statement → benefits → FAQ → capture.
- `site/logo.svg` — chevron fleet mark, also the favicon.
- `marketing/` — production scripts, Higgsfield technique guide, market research,
  content system, 30-day calendar, DM automation, and 24 rendered launch clips
  in `marketing/generated/`.

## Canonical naming (don't let these drift again)

Stage names and slash commands must match across the admin panel, the skills
files, and the site. One drift bug already shipped and was caught in review
(the panel showed `/cf-*` commands for the product machine):

- Content: `/cf-ideas` `/cf-script` `/cf-render` `/cf-assemble` `/cf-schedule`
- Product: `/dp-validate` `/dp-build` `/dp-package` `/dp-launch` `/dp-schedule`

## Honesty rules (baked into every file — keep them)

- **No income claims anywhere.** The only guarantee is a 30-day **money-back**
  guarantee, which is about refunds, never about earnings.
- **No fabricated third-party pricing.** We never print Claude/Higgsfield/Postiz
  prices — they change, and a stale number on a sales page is how people get
  burned. Every requirements doc names the service and sends the buyer to the
  vendor's own pricing page.
- **No invented value anchor.** The value-stack table itemises components and
  says plainly that we won't invent a strike-through number. If you want to
  harden the "commissioned" column into real figures, get real quotes first.
- **No fabricated testimonials.** The proof section ships as three honest empty
  slots. Replace them only with real buyer quotes, with permission.
- **Subscriptions disclosed before the price**, not after.

## needsUser (only you can do these)

1. **Domain** — `claudefleet.com` was available at last check (whois, 2026-07-12).
   Re-verify before paying; point it at the Vercel deployment once registered.
2. **Gumroad / LemonSqueezy** — upload the zips from `dist/`, set $99 / $99 / $149.
3. **Replace in `site/index.html`**: `GUMROAD_LINK_CONTENT_MACHINE`,
   `GUMROAD_LINK_PRODUCT_MACHINE`, `GUMROAD_LINK_BUNDLE`, `FORM_ENDPOINT`.
4. **ManyChat** — the keywords changed to **CONTENT / PRODUCT / BOTH / START**.
   Delete or repoint the old STACK/VAULT/OS/FLEET/FULL automations so old reels
   don't DM dead offers. Copy is in `marketing/dm-automation.md`.
5. **Reshoot the launch reels** — the 24 clips in `marketing/generated/` were cut
   for the old four-product catalog. The visuals mostly still work (abstract
   pipeline/hologram footage), but the voiceover and CTA keywords in
   `marketing/production-scripts.md` now reference retired products and need a
   pass before posting.
6. **Free lead magnet** — the capture section promises "the engine architecture
   as a PDF". `products/_engine/ENGINE.md` is that content; export it to PDF and
   wire it to the form, or change the promise.
