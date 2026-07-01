# Green Horizon — Project Context

## Project overview
Green Horizon is a pre-opening boutique hotel on a cliff above Bulgaria's Black Sea coast.
Family-built, 4 rooms + 6 villas. Opening 2026. No booking system — register interest only.
This is the Phase 1 marketing site with three design versions for client review.

---

## Repository
- GitHub: https://github.com/ksvaswani-collab/green-horizon
- Netlify: https://green-horizonn.netlify.app
- Live URL once deployed: green-horizonn.netlify.app

## Tech stack
- Framework: Astro v5 (static output)
- Styling: Tailwind CSS v4 (V1/V2 only, via @tailwindcss/vite), plain CSS (V3)
- Animations: GSAP + ScrollTrigger (V1/V2), AOS v2 (V3)
- Package manager: pnpm
- Deploy: Netlify (build: `pnpm run build`, publish: `dist`, base: empty)
- Git: two branches — `main` (stable), `testing` (work in progress)

---

## Three versions

### Version 1 — /en/ /nl/ /bg/
The primary production version. Light linen theme.
- Nav: floating pill groups (wordmark | links | lang dropdown + CTA)
- Hero: full-bleed cliffside photo, bottom-left text, GSAP scroll-driven animation
- Sections: Our Story, Four Elements (horizontal scroll pin), Experiences, Construction Journey, Rooms, Register Interest, Footer
- Colors: #F0EDE6 linen bg, #2B4A3C primary green, #8B6F5C copper accent
- Fonts: DM Serif Display (display), Manrope (body/UI)
- i18n: /en/ /nl/ /bg/ — copy in src/i18n/*.json
- IMPORTANT: astro.config.mjs has `redirectToDefaultLocale: false` — required for /v2/ and /v3/ to not 404

### Version 2 — /v2/
Dark editorial version. "Midnight Magnetic" aesthetic.
- Nav: minimal, wordmark italic left · nav links centre · lang dropdown + CTA right
- Hero: "HORIZON" text-mask with hero image through letterforms. On scroll: letters scatter + images fly to corners → full-bleed image reveals. Carousel of 4 images (carousel-1/2/3/4.jpg from Pexels)
- Elements: GSAP absolute-position carousel (osmo.supply reference), all 4 cards stacked, side cards peek
- Build: editorial 50/50 split per entry, clip-path reveals on scroll
- Colors: #1F1D18 warm charcoal bg, #272420 alt sections, #2B4A3C primary, #A8D5C2 sage accent
- Fonts: Manrope 900 (display/headlines), DM Serif Display italic (secondary), self-hosted via @fontsource
- GSAP loaded globally in BaseV2.astro, exposed as window.gsap + window.ScrollTrigger

### Version 3 — /v3/
Warm editorial "Paper & Grain" version. Fully rebuilt with Lora typeface throughout.
- Nav: fixed top, wordmark + centre links + register CTA. Nav links do NOT scroll to sections (single-page nav removed — not a one-page site)
- Hero: full-bleed image, centred "Green Horizon" in Lora 700 italic, two ghost buttons
- Story: centred guillemet pull-quote, two-column body
- Elements: 3-column rows — large element name | long body | grayscale image — separated by rules
- Experiences: asymmetric 2-column photo grid (portrait left, 2 landscape right), all images grayscale
- Build: 3-column newspaper grid with dates
- Suites: 4 alternating horizontal spreads with roman numerals (I-IV). Suite names: The Cliff Room, The Forest Room, The Horizon Suite, The Garden Room
- Register: dark #2A1F16 bg, 50/50 split, full form (name/email/country/source/message)
- Footer: cream bg, dark card inside containing tagline + nav links + ghost wordmark "Green Horizon"
- Animations: AOS (data-aos attributes on elements)
- Colors: --bg #F7F2EA, --surface #EDE8DF, --surface-2 #F0ECE5, --ink #1A1510, --muted #8C7B6A, --rust #B85C38, --dark #2A1F16
- Fonts: Lora ONLY throughout — 700 italic for display, 600 italic for headings, 400 normal for body, 600 normal for labels
- CSS: all in src/styles/v3.css + component <style> blocks. NO inline CSS.
- Fontsource: @fontsource/lora (400, 400-italic, 600, 600-italic, 700, 700-italic)

---

## File structure
src/ ├── components/ │ ├── Nav.astro ← V1 nav (pill groups) │ ├── sections/ ← V1 sections │ ├── v2/ ← All V2 components │ └── v3/ ← All V3 components ├── layouts/ │ ├── Base.astro ← V1 layout (loads tokens.css, GSAP) │ ├── BaseV2.astro ← V2 layout (loads v2.css, GSAP) │ └── BaseV3.astro ← V3 layout (loads v3.css, initialises AOS) ├── pages/ │ ├── index.astro ← redirects to /en/ │ ├── en/index.astro ← V1 English │ ├── nl/index.astro ← V1 Dutch │ ├── bg/index.astro ← V1 Bulgarian │ ├── v2/index.astro ← V2 │ └── v3/index.astro ← V3 ├── i18n/ │ ├── en.json nl.json bg.json ├── styles/ │ ├── tokens.css ← V1 design tokens │ ├── v2.css ← V2 tokens + layout │ └── v3.css ← V3 complete CSS (Lora, all classes, no inline) └── assets/images/ ← managed via public/images/ public/images/ ← all images (hero.jpg, earth.jpg, water.jpg, etc.)


---

## Key decisions / non-obvious things
1. `astro.config.mjs` MUST have `routing: { prefixDefaultLocale: true, redirectToDefaultLocale: false }` — without the false flag, /v2/ and /v3/ return 404
2. V3 uses AOS NOT GSAP — import 'aos/dist/aos.css' in v3.css, `import AOS from 'aos'` + `AOS.init()` in BaseV3.astro script
3. V3 nav links use `href="#"` with `event.preventDefault()` — they are NOT anchors to sections
4. V1 and V2 both use GSAP which cannot be swapped for AOS (horizontal scroll pin, char scatter, etc. are GSAP-specific)
5. Fontsource packages: V1+V2 use @fontsource/dm-serif-display and @fontsource/manrope. V3 uses @fontsource/lora ONLY
6. The grain texture on V3 body is a pure CSS SVG data URI in body::after — no image file
7. All three versions share public/images/ for actual photos
8. netlify.toml: `command = "pnpm run build"`, `publish = "dist"`. Base directory must be EMPTY in Netlify dashboard

---

## Images in public/images/
hero.jpg, story.jpg, earth.jpg, water.jpg, fire.jpg, air.jpg
exp-forest.jpg, exp-dunes.jpg, exp-sea.jpg
room-earth.jpg, room-water.jpg, room-fire.jpg, room-air.jpg
build-june-2025.jpg, build-march-2025.jpg, build-nov-2024.jpg
carousel-1.jpg, carousel-2.jpg, carousel-3.jpg, carousel-4.jpg (V2 hero carousel — Pexels)
footer-forest.jpg (V2 footer background)

---

## Brand copy rules
NEVER use: sanctuary / curated / bespoke / elevated / nestled / haven / retreat / luxurious / exclusive / world-class / unforgettable / escape

Key copy lines:
- Hero V2: "THE HORIZON CALLS."
- Hero V3: "Green Horizon" (centred display)
- Pull quote: "The most profound hospitality is not about service. It is about place."
- CTA: "Be first on the horizon."
- Register: "One conviction. One cliff. One sea."
- Coordinates: 42°N · 27°E · Black Sea, Bulgaria
- Opening: 2026

---

## Current status (as of session handoff)
- V1: ✅ stable and deployed
- V2: ✅ functional, hero scatter animation + carousel working
- V3: 🔄 recently rebuilt with Lora + AOS, pushed to main — verify on Netlify after deploy
- Netlify build was previously failing due to wrong base directory setting — now fixed (base = empty)
