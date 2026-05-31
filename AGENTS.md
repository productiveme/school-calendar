# AGENTS.md

## Commands

```bash
npm run dev        # dev server at http://localhost:4321
npm run build      # static output → dist/
npm run preview    # serve dist/ locally

docker build -t school-planner .
docker run -d -p 8099:80 school-planner   # serves on http://localhost:8099
```

No test runner, no linter configured. Build is the verification step — `npm run build` must complete without errors before committing.

## Stack

- **Astro 6 + Tailwind CSS v4** — no `tailwind.config.*` file; Tailwind is loaded as a Vite plugin (`@tailwindcss/vite`). CSS config lives in `src/styles/global.css` via `@import "tailwindcss"`.
- **No JS framework** — interactivity is plain TypeScript in a single `<script>` block in `src/pages/index.astro`. No React/Vue/Svelte islands.
- **Single page app** — everything is in `src/pages/index.astro`. Components are HTML strings built by JS functions, not Astro components.

## Architecture

All logic lives in one file: `src/pages/index.astro`

- `state` object holds `period`, `months`, `activities[]`, `colour`
- `buildMonthCalendar()` — renders screen preview (uses Tailwind classes + CSS vars)
- `buildPrintCalendar()` — renders print view (fully inline styles, no CSS classes, real mm dimensions for A4)
- `renderCalendar()` — updates both `#calendar-preview` and `#calendar-print`
- `localStorage` keys: `planner-activities`, `planner-colour`

## Print output

- `@page` rule: A4 landscape, 8mm margins — defined in `src/styles/global.css`
- `.no-print` hides the UI; `.print-only` shows `#calendar-print`
- Print calendar uses `height: 194mm` (210mm − 16mm margins) with `grid-template-rows: repeat(N, 1fr)` to fill the page exactly
- `transparent` must never be used in `radial-gradient` for print — use explicit `#ffffff` instead or it prints as black

## Deployment

Dockerfile: multi-stage — Node 22 Alpine builds static files, nginx Alpine serves `dist/`. Deployed via Dokploy pointing at the repo root (no extra config needed).
