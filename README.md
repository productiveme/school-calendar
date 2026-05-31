# School Planner

A minimal, modern calendar app for printing A4 landscape monthly planners — designed for school scheduling and study planning.

Pick a month or quarter, enter known activities, choose a colour, and print. Each child gets their own colour-coded calendar with dotted lines for handwritten notes.

## Features

- **Monthly & quarterly views** — This Month, Next Month, This Quarter, Next Quarter
- **Activity entries** — date, description (include time inline), optional weekly repeat
- **Click to edit** — tap any activity pill on the calendar to edit or delete it
- **Quick add** — hover a day cell and click `+` to pre-select that date in the form
- **Export / Import** — copy and paste activities as YAML to share between sessions
- **Colour picker** — 8 presets + custom colour; persisted per browser so each child can have their own
- **Print-optimised** — A4 landscape, 8mm margins, each month fills exactly one page
- **Dotted writing lines** — equal space in every day cell for handwritten additions
- **Mobile friendly** — full-width form on small screens, split view on desktop
- **No account, no backend** — runs fully in the browser; activities saved to `localStorage`

## Commands

```bash
npm install        # install dependencies
npm run dev        # dev server → http://localhost:4321
npm run build      # static output → dist/
npm run preview    # serve dist/ locally
```

## Docker

```bash
docker build -t school-planner .
docker run -d -p 3000:3000 school-planner
# open http://localhost:3000
```

## Stack

- [Astro 6](https://astro.build) — static site generation
- [Tailwind CSS v4](https://tailwindcss.com) — Vite plugin, no config file
- Plain TypeScript — no JS framework
- `serve` — static file server in Docker

## License

MIT
