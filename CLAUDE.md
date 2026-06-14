# CLAUDE.md — Curriculum (CV)

Single-page CV for Júlio Silva, built with **Typst** (migrated away from LaTeX/AltaCV).
Source lives in `cv/`; the generated PDF is `output/CV_JULIO_SILVA.pdf` (linked from the
portfolio site's "View CV", so committing it publishes it).

## Build & verify

- **Build:** `make build` — compiles `cv/curriculum.typ` with Typst in Docker
  (`ghcr.io/typst/typst`) and compresses with Ghostscript into `output/CV_JULIO_SILVA.pdf`.
  Requires Docker. There is **no local `typst`** and **no `xelatex`**.
- **Always verify visually.** This environment has no poppler / `pdftoppm`, so render a PNG
  and read it instead of the PDF:
  ```bash
  docker run --rm -u "$(id -u):$(id -g)" \
    -v "$PWD/cv":/cv:ro -v "$PWD/output":/output \
    ghcr.io/typst/typst:latest \
    compile --font-path /cv/fonts --format png --ppi 300 \
    /cv/curriculum.typ "/output/preview-{p}.png"
  ```
  Read `preview-*.png`. A `preview-2.png` means it overflowed — it **must stay one page**.
  Delete the preview PNGs before committing (only the PDF belongs in `output/`).

## Source layout

- `cv/config.typ` — content variables (name, tagline, summary, contact). Edit here for content.
- `cv/template.typ` — design system: colors + helpers (`cv-section`, `cv-event`, `cv-skill-row`,
  `skill-cat`, `chip`, `cv-icon`).
- `cv/curriculum.typ` — page setup + layout (header, two-column body).
- `cv/sections/*.typ` — experience, education, skills, languages, links.
- `cv/icons/*.svg` — bundled inline icons (see below).
- `cv/fonts/` — bundled Nimbus Sans (loaded via `--font-path`).

## Design conventions (professional & recruiter-friendly)

- **One page, always.** If it overflows, tighten spacing before cutting content.
- **Clean and professional, not flashy.** Avoid "website/terminal" gimmicks (no monospace UI
  font, no `01/02` section numbers).
- **Accent:** deep professional navy `#1F3A5F` (`c-accent`); headings near-black (`c-ink`).
  Keep the palette muted and formal.
- **Icons:** bundled local SVGs in `cv/icons/` — no FontAwesome, no Typst packages (the Docker
  build has no network). Match the accent by editing each SVG's `fill`/`stroke`. Use inline via
  `cv-icon("name")`.
- **Skills:** categorized chips (`skill-cat`). Highlight the core stack **subtly** — navy text +
  thin navy outline, no fill, no bold; non-core chips are muted gray.
- Section headers: title-case, bold, with a navy underline. Photo: circular, top-right.

## Content rules

- **Truthful only — never fabricate metrics, numbers, titles, or tools.** If a number would help
  but isn't known, keep the wording qualitative.
- Current facts: title **Backend Engineer**; **six years** experience; Viseu, Portugal.
  Core stack (highlighted) = Python, SQL, Django, FastAPI, PostgreSQL, Redis, Docker, Linux,
  Sentry, New Relic, Git, Claude Code. AWS is real.
- Keep wording aligned with the portfolio repo (`jmbcs/portfolio`).

## Git

- Conventional commits; imperative subject ≤50 chars.
- English only.
