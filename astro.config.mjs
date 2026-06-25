import { defineConfig } from 'astro/config'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  vite: {
    plugins: [tailwindcss()],
  },
  i18n: {
    defaultLocale: 'en',
    locales: ['en', 'nl', 'bg'],
    routing: {
      prefixDefaultLocale: true,
      // Allow /v2/ and /v3/ to bypass i18n routing
      redirectToDefaultLocale: false,
    },
  },
})
