# amitkumargoyal.github.io

Personal site built with [Astro](https://astro.build), deployed to GitHub Pages.

## Local development

Requirements: Node 20+ and npm.

```bash
npm install
npm run dev       # localhost:4321
npm run build     # output to dist/
npm run preview   # preview the production build
```

## Deploying

Pushing to `main` triggers `.github/workflows/deploy.yml`, which builds the site
and publishes to GitHub Pages. **One-time setup**: in the repo settings, go to
*Pages* and set the source to *GitHub Actions* (not "Deploy from a branch").

## Structure

```
src/
  layouts/      Base.astro (header/footer), Note.astro (for MDX notes)
  pages/        Routes — each file is a URL
    index.astro          /
    artbook/index.astro  /artbook/
    problems/index.astro /problems/
    notes/index.astro    /notes/
    notes/*.mdx          /notes/{slug}/
  styles/global.css      All design tokens and base styles
public/         Static files served as-is (favicon, images, artbook/)
scripts/        One-off helper scripts (Artbook extraction, etc.)
```

## Adding content

**A new note.** Drop an `.mdx` file in `src/pages/notes/`:

```mdx
---
layout: ../../layouts/Note.astro
title: The title of the note
date: 2026-05-22
blurb: One-line summary that appears on the notes index.
---

Body in Markdown. Inline maths like $u(x) = \log x$ and display:

$$
\sum_{i=1}^n x_i = \bar{x} n.
$$
```

The notes index auto-discovers and sorts by date.

**Artbook pages.** The 100 postcards are already extracted and committed to
`public/artbook/` (`page-001.jpg` through `page-100.jpg` for thumbnails,
`page-001-full.jpg` through `page-100-full.jpg` for the lightbox, plus
`cover.jpg` / `cover-full.jpg` for the title page). If you regenerate from
an updated source PDF, the helper script does it for you:

```bash
./scripts/extract-artbook.sh path/to/EconArtbook.pdf
```

**A new problem set.** Replace the placeholder block in `src/pages/problems/index.astro`
with a list. The comment in the file shows the structure.

## Design tokens

All colors and type live as CSS variables in `src/styles/global.css`. Brand
palette: cream `#FAF7F2`, violet `#5A1BA6`, terracotta `#A03A2C`, sage `#8AA08A`.
Type: EB Garamond (body), Cormorant Garamond (display), KaTeX Computer Modern (math).
