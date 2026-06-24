# Green Horizon

**Boutique hotel + private villas — Black Sea coast, Bulgaria. Opening 2026.**

A marketing and story site built with Astro, GSAP, and Tailwind CSS v4. Three languages (EN / NL / BG). No booking — register interest only.

---

## Stack

| Tool | Version | Purpose |
|---|---|---|
| [Astro](https://astro.build) | v5 | Static site framework |
| [Tailwind CSS v4](https://tailwindcss.com) | v4 | Styling via `@tailwindcss/vite` |
| [GSAP + ScrollTrigger](https://gsap.com) | v3 | All animations |
| [Manrope](https://fonts.google.com/specimen/Manrope) | — | Body / UI typeface (self-hosted) |
| [DM Serif Display](https://fonts.google.com/specimen/DM+Serif+Display) | — | Display typeface (self-hosted) |
| [Alegreya](https://fonts.google.com/specimen/Alegreya) | — | Bulgarian Cyrillic display fallback |

---

## Quick start

```bash
git clone https://github.com/ksvaswani-collab/green-horizon.git
cd green-horizon
pnpm install
pnpm dev
```

Open **http://localhost:4321/en/**

---

## Project structure

```
src/
├── components/
│   ├── Nav.astro                      # Fixed nav, scroll background, mobile overlay
│   └── sections/
│       ├── Hero.astro                 # Full-viewport hero, GSAP word stagger
│       ├── OurStory.astro             # Pull-quote word-by-word reveal
│       ├── FourElements.astro         # GSAP horizontal scroll pin (desktop)
│       ├── Experiences.astro          # 3-card stagger
│       ├── ConstructionJourney.astro  # Vertical timeline with scroll reveals
│       ├── Rooms.astro                # 4-card grid
│       ├── RegisterInterest.astro     # Netlify form (light section)
│       └── Footer.astro               # 4-column footer
├── layouts/
│   └── Base.astro                     # HTML shell, GSAP global registration
├── pages/
│   ├── index.astro                    # → redirects to /en/
│   ├── en/index.astro
│   ├── nl/index.astro
│   └── bg/index.astro
├── i18n/
│   ├── en.json                        # English copy
│   ├── nl.json                        # Dutch copy
│   └── bg.json                        # Bulgarian copy (Cyrillic)
└── styles/
    └── tokens.css                     # Design tokens + Tailwind theme
```

---

## Design tokens

Defined in `src/styles/tokens.css`:

| Token | Value | Usage |
|---|---|---|
| `--color-midnight` | `#0D1117` | Primary background |
| `--color-forest` | `#1A2420` | Alt section background, nav on scroll |
| `--color-linen` | `#F0EDE6` | Register Interest section only |
| `--color-limestone` | `#E8E4DC` | Primary text |
| `--color-seafoam` | `#C5D4CE` | Secondary text |
| `--color-copper` | `#8B6F5C` | CTAs and active states |

---

## GSAP animations

| Section | Technique |
|---|---|
| Hero | Timeline — image fade-in, words stagger up, scroll-line pulse |
| Our Story | ScrollTrigger word-by-word pull-quote reveal |
| Four Elements | Horizontal scroll pin (`scrub: 1`, `400vh` wrapper). Mobile: vertical fallback |
| Experiences | ScrollTrigger stagger per card |
| Construction Journal | ScrollTrigger per timeline entry |
| Rooms | ScrollTrigger stagger per room card |
| Nav | ScrollTrigger scroll-activated background |

All animations respect `prefers-reduced-motion: reduce`.

---

## i18n

Routes: `/en/` · `/nl/` · `/bg/`

All copy lives in `src/i18n/[lang].json`. The Bulgarian route automatically switches the display typeface from DM Serif Display to Alegreya (Cyrillic support) via `:lang(bg) { --font-display: 'Alegreya' }`.

---

## Images

Placeholder images (solid-colour PNGs) are in `public/images/`. Replace with real photography before launch.

| File | Dimensions | Scene |
|---|---|---|
| `hero.jpg` | 1920×1080 | Cliff above the Black Sea at dusk |
| `story.jpg` | 1200×800 | Construction on the cliff / family |
| `earth.jpg` | 1920×1080 | Cliff soil, ancient forest floor |
| `water.jpg` | 1920×1080 | Black Sea surface at dusk |
| `fire.jpg` | 1920×1080 | Open fire close-up |
| `air.jpg` | 1920×1080 | Horizon line — sea meets sky |
| `exp-forest.jpg` | 800×1067 | Strandzha forest walk |
| `exp-dunes.jpg` | 800×1067 | Sunrise on the dunes |
| `exp-sea.jpg` | 800×1067 | The sea at dusk |
| `room-earth.jpg` | 800×600 | Earth suite |
| `room-water.jpg` | 800×600 | Water suite |
| `room-fire.jpg` | 800×600 | Fire suite |
| `room-air.jpg` | 800×600 | Air suite |
| `build-june-2025.jpg` | 1280×720 | Terrace foundation work |
| `build-march-2025.jpg` | 1280×720 | Earth suite walls |
| `build-nov-2024.jpg` | 1280×720 | Oak frame construction |

---

## Deployment

**Netlify** (recommended — native form handling):

1. Connect the GitHub repo in Netlify
2. Build command: `pnpm build`
3. Publish directory: `dist`
4. The Register Interest form uses `data-netlify="true"` — works automatically on Netlify

**Vercel:**

```bash
pnpm build
# deploy dist/ folder
```

---

## Copy rules

Never use: sanctuary / curated / bespoke / elevated / nestled / haven / retreat / luxurious / exclusive / world-class / unforgettable / escape

---

## Coordinates

**42°N · 27°E · Black Sea, Bulgaria**
