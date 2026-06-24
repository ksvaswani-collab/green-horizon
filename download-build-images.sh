#!/bin/bash
# Better build-section images: evocative coastal/nature/craft — not construction
OUT="public/images"
BASE="https://images.unsplash.com"

declare -A IMGS=(
  # Cliff-edge view at golden hour — the setting itself
  ["build-june-2025.jpg"]="${BASE}/photo-1507525428034-b723cf961d3e?w=1280&h=720&fit=crop&crop=center&q=85"
  # Close detail: rough stone wall texture — craft, material, place
  ["build-march-2025.jpg"]="${BASE}/photo-1558618666-fcd25c85cd64?w=1280&h=720&fit=crop&crop=center&q=85"
  # Forest at low light — the land before the build
  ["build-nov-2024.jpg"]="${BASE}/photo-1448375240586-882707db888b?w=1280&h=720&fit=crop&crop=top&q=85"
)
for NAME in "${!IMGS[@]}"; do
  echo -n "  $NAME ... "
  HTTP=$(curl -sL --max-time 20 -o "${OUT}/${NAME}" -w "%{http_code}" "${IMGS[$NAME]}")
  SIZE=$(wc -c < "${OUT}/${NAME}" 2>/dev/null || echo 0)
  [ "$HTTP" = "200" ] && [ "$SIZE" -gt 5000 ] && echo "✓" || echo "✗ (HTTP $HTTP)"
done
