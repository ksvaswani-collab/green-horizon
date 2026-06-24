#!/bin/bash
# Downloads curated Unsplash images for Green Horizon
# All images are free to use under the Unsplash License

OUT="public/images"
mkdir -p "$OUT"

BASE="https://images.unsplash.com"

declare -A IMAGES=(
  # Hero: dramatic coastal cliff at dusk
  ["hero.jpg"]="${BASE}/photo-1507525428034-b723cf961d3e?w=1920&h=1080&fit=crop&q=85"
  # Story: forest / woodland construction feel
  ["story.jpg"]="${BASE}/photo-1448375240586-882707db888b?w=1200&h=800&fit=crop&q=85"
  # Earth: rocky cliff / soil / forest floor
  ["earth.jpg"]="${BASE}/photo-1433086966358-54859d0ed716?w=1920&h=1080&fit=crop&q=85"
  # Water: dark deep sea surface
  ["water.jpg"]="${BASE}/photo-1505118380757-91f5f5632de0?w=1920&h=1080&fit=crop&q=85"
  # Fire: open fire / flames close-up
  ["fire.jpg"]="${BASE}/photo-1511974035430-5de47d3b95da?w=1920&h=1080&fit=crop&q=85"
  # Air: open horizon / sky meets sea
  ["air.jpg"]="${BASE}/photo-1419242902214-272b3f66ee7a?w=1920&h=1080&fit=crop&q=85"
  # Experiences: forest walk (Strandzha)
  ["exp-forest.jpg"]="${BASE}/photo-1448375240586-882707db888b?w=800&h=1067&fit=crop&q=85"
  # Experiences: dunes at sunrise
  ["exp-dunes.jpg"]="${BASE}/photo-1507525428034-b723cf961d3e?w=800&h=1067&fit=crop&q=85"
  # Experiences: sea at dusk
  ["exp-sea.jpg"]="${BASE}/photo-1505118380757-91f5f5632de0?w=800&h=1067&fit=crop&q=85"
  # Rooms: earth suite (stone, natural materials)
  ["room-earth.jpg"]="${BASE}/photo-1506905925346-21bda4d32df4?w=800&h=600&fit=crop&q=85"
  # Rooms: water suite (sea view, calm)
  ["room-water.jpg"]="${BASE}/photo-1499793983690-e29da59ef1c2?w=800&h=600&fit=crop&q=85"
  # Rooms: fire suite (warm interior)
  ["room-fire.jpg"]="${BASE}/photo-1522771739844-6a9f6d5f14af?w=800&h=600&fit=crop&q=85"
  # Rooms: air suite (open sky view)
  ["room-air.jpg"]="${BASE}/photo-1464822759023-fed622ff2c3b?w=800&h=600&fit=crop&q=85"
  # Build journal: construction / concrete work
  ["build-june-2025.jpg"]="${BASE}/photo-1504307651254-35680f356dfd?w=1280&h=720&fit=crop&q=85"
  # Build journal: stone / masonry work
  ["build-march-2025.jpg"]="${BASE}/photo-1558618666-fcd25c85cd64?w=1280&h=720&fit=crop&q=85"
  # Build journal: timber frame / carpentry
  ["build-nov-2024.jpg"]="${BASE}/photo-1503387762-592deb58ef4e?w=1280&h=720&fit=crop&q=85"
)

DONE=0
FAIL=0

for NAME in "${!IMAGES[@]}"; do
  URL="${IMAGES[$NAME]}"
  echo -n "  Downloading $NAME ... "
  HTTP=$(curl -sL --max-time 20 -o "${OUT}/${NAME}" -w "%{http_code}" "$URL")
  SIZE=$(wc -c < "${OUT}/${NAME}" 2>/dev/null || echo 0)
  if [ "$HTTP" = "200" ] && [ "$SIZE" -gt 10000 ]; then
    echo "✓  (${SIZE} bytes)"
    DONE=$((DONE+1))
  else
    echo "✗  (HTTP $HTTP, ${SIZE} bytes)"
    FAIL=$((FAIL+1))
  fi
done

echo ""
echo "Done: $DONE  Failed: $FAIL"
