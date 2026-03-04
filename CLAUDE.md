# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Static HTML website for **Enlevia** ([www.enlevia.com](https://www.enlevia.com)) — a Danish data consulting business by Hans Baggesen. No build system, no package manager, no framework.

## Deploying

This is a GitHub Pages site. Pushing to `main` publishes to [www.enlevia.com](https://www.enlevia.com) (configured via `CNAME`). There is no build step.

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
- `profile.html` — Hans Baggesen's profile ("Om Enlevia" in main nav)

**Navigation** (consistent across all pages):

- Hjem/Service → `/`
- Indsigter → `/blog.html`
- Om Enlevia → `/profile.html`
- Kontakt → `/#kontakt`

**Styles — two separate CSS systems:**

- `css/style-v2.css` — used only by `blog/*.html` articles (teal palette, `--accent-primary: #2D5F63`)
- `index.html`, `blog.html`, and `profile.html` each have **self-contained embedded CSS** (green palette: `#1a3a2e` / `#2d5c48`). These pages do NOT use `css/style-v2.css`.
- Blog articles reference the stylesheet with an absolute path (`/css/style-v2.css`)

**JavaScript:**

- `js/main.js` — sets copyright year in footer + mobile nav toggle (`.nav-toggle` / `.nav-links`)

**Content language:** Danish throughout. Use Danish text for any new copy.

**Blog articles** in `blog/` exist both as `.docx` source files and compiled `.html` files. The `.docx` files are not served.

**Scratch folder:** `Mess/` contains archived/draft files, not served.

## CSS Conventions

**`css/style-v2.css`** (blog articles):

- `--accent-primary: #2D5F63` (deep teal)
- `--font-sans: 'Inter'`, `--font-serif: 'Sentient'`
- Spacing scale: `--space-xs` through `--space-2xl`

**Embedded CSS** (index, blog.html, profile):

- Green palette: `--green-dark: #1a3a2e`, `--green-mid: #2d5c48`, `--green-accent: #3d7a5f`
- Fonts: Fraunces (display) + DM Sans (body)
- Section variants: `.section-dark` and `.section-sand`
- Cards use `.card` inside `.grid.features` layout
