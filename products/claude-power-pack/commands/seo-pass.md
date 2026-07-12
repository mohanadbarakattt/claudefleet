---
description: Audit and fix meta tags, Open Graph tags, headings, and other on-page SEO basics for the current project.
---

Audit the current project's on-page SEO fundamentals, then fix what's fixable without further
input. This is a technical on-page pass — not a content strategy or keyword research exercise.

## Step 1 — Find the pages

Locate the project's page/route files (check for a `pages/`, `app/`, `src/routes`, static HTML
files, or CMS templates depending on framework). If the project is large, sample the main
templates/layouts plus 2-3 representative pages rather than reading every single page file.

## Step 2 — Audit checklist

For each page/template found, check:

- **Title tag**: present, unique per page, under ~60 characters, includes the page's actual
  topic (not a generic site-wide title repeated everywhere).
- **Meta description**: present, unique per page, ~150-160 characters, describes the page's
  actual content (not boilerplate copy-pasted across pages).
- **Open Graph tags**: `og:title`, `og:description`, `og:image`, `og:url`, `og:type` present.
  Check that `og:image` points to a real, reasonably-sized image (not missing/broken).
- **Twitter Card tags**: `twitter:card`, `twitter:title`, `twitter:description`, `twitter:image` —
  present, or falling back correctly to Open Graph equivalents.
- **Heading structure**: exactly one `<h1>` per page, headings in logical descending order (no
  jump from `h1` straight to `h4`), headings describe content rather than being purely stylistic.
- **Canonical tags**: present and pointing to the correct self-URL, especially if the site has
  any URL variations (trailing slash, query params, www vs non-www).
- **Image alt text**: meaningful alt attributes on content images (not filenames, not empty on
  non-decorative images).
- **Structured data**: check for existing JSON-LD (Organization, Article, Product, etc.) — note
  if present/absent, don't invent data that isn't real.
- **robots.txt / sitemap.xml**: present, not accidentally blocking the whole site, sitemap
  references real routes.

## Step 3 — Fix what's safely fixable

Apply direct fixes for:
- Missing or duplicate title/meta description tags (write real, page-specific copy based on the
  page's actual content — never generic filler).
- Missing Open Graph/Twitter Card tags where the data needed (title, description, existing image)
  is already available on the page.
- Heading order/hierarchy issues.
- Missing or wrong alt text where the image's purpose is inferable from context.
- Missing canonical tags.

Do NOT fabricate: business names, addresses, prices, testimonials, review counts, or any factual
claim not already present in the codebase or content. If a fix needs a real fact you don't have
(e.g., a proper `og:image` that doesn't exist yet), flag it in the report instead of inventing one.

## Step 4 — Report

```
SEO PASS: <project name>

Pages audited: <list or count + sampling method>

FIXED:
- <file>: <what was added/changed and why>

FLAGGED (needs real content/assets you don't have):
- <file>: <what's missing and what's needed to fix it>

NOT APPLICABLE / already good:
- <brief note>
```

Verify each fix by re-reading the file after editing — a broken meta tag is worse than a missing
one.
