# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Static HTML website for **Enlevia** (www.enlevia.com) — a Danish data consulting business by Hans Baggesen. No build system, no package manager, no framework.

## Deploying

This is a GitHub Pages site. Pushing to `main` publishes to www.enlevia.com (configured via `CNAME`). There is no build step.

## Updating Structured Data (JSON-LD)

The canonical JSON-LD for `index.html` is maintained in `structured-data/enlevia.schema.json`. After editing it, sync it into `index.html` using:

```powershell
pwsh scripts/sync-ldjson.ps1
```

## Architecture

**Pages:**
- `index.html` — homepage (hero, trigger moments, services, contact)
- `blog.html` — article listing page
- `blog/*.html` — individual blog articles
- `profile.html` — Hans Baggesen's profile (unlinked from main nav)
- `About.html` — standalone about page with its own self-contained design system (Fraunces + DM Sans fonts, green palette `#1a3a2e`/`#2d5c48`); does **not** use `css/style-v2.css`

**Styles:**
- `css/style-v2.css` — the single shared stylesheet (CSS custom properties, no preprocessor)
- Page-specific styles are embedded in `<style>` tags within each HTML file
- Blog articles reference the stylesheet with an absolute path (`/css/style-v2.css`); other pages use a relative path (`css/style-v2.css`)

**JavaScript:**
- `js/main.js` — minimal; only sets the copyright year in the footer

**Content language:** Danish throughout. Use Danish text for any new copy.

**Blog articles** in `blog/` exist both as `.docx` source files and compiled `.html` files. The `.docx` files are not served.

**Scratch files:** `Notes_toabout.md` is a working notes file in the repo root — not served, not part of the site.

## CSS Conventions

The stylesheet uses CSS custom properties defined in `:root` (colors, spacing scale, fonts). Key design tokens:
- `--accent-primary: #2D5F63` (deep teal) — primary brand color
- `--font-sans: 'Inter'` — headings and UI
- `--font-serif: 'Sentient'` — body text
- Section variants: `.section-dark` (dark hero card) and `.section-sand` (warm background sections)
- Cards use `.card` inside a `.grid.features` layout
