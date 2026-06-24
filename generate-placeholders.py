"""
Creates placeholder images for Green Horizon.
Each image is a solid-color JPEG with the brand palette.
Replace with real photography before launch.
"""
import struct, zlib, os

def make_png(width, height, r, g, b):
    """Build a minimal valid PNG with a solid colour."""
    def chunk(name, data):
        c = struct.pack('>I', len(data)) + name + data
        return c + struct.pack('>I', zlib.crc32(name + data) & 0xFFFFFFFF)

    sig = b'\x89PNG\r\n\x1a\n'
    ihdr = chunk(b'IHDR', struct.pack('>IIBBBBB', width, height, 8, 2, 0, 0, 0))

    # Build raw scanlines: filter byte (0) + RGB pixels
    row = b'\x00' + bytes([r, g, b]) * width
    raw = row * height
    idat = chunk(b'IDAT', zlib.compress(raw, 1))
    iend = chunk(b'IEND', b'')
    return sig + ihdr + idat + iend

out = 'public/images'
os.makedirs(out, exist_ok=True)

images = {
    # Hero & story
    'hero.jpg':              (30,  35,  45),   # deep indigo-midnight
    'story.jpg':             (26,  36,  32),   # forest green

    # Four elements
    'earth.jpg':             (26,  36,  32),   # forest #1A2420
    'water.jpg':             (13,  28,  34),   # deep water #0D1C22
    'fire.jpg':              (26,  18,  16),   # ember dark #1A1210
    'air.jpg':               (17,  19,  24),   # dark sky #111318

    # Experiences
    'exp-forest.jpg':        (22,  38,  28),   # forest green
    'exp-dunes.jpg':         (60,  50,  35),   # warm sand
    'exp-sea.jpg':           (13,  28,  50),   # deep sea

    # Rooms
    'room-earth.jpg':        (35,  28,  22),   # warm earth
    'room-water.jpg':        (18,  30,  45),   # sea blue
    'room-fire.jpg':         (45,  25,  18),   # warm amber
    'room-air.jpg':          (22,  26,  35),   # cool sky

    # Build journal
    'build-june-2025.jpg':   (40,  40,  38),   # concrete grey
    'build-march-2025.jpg':  (35,  30,  25),   # stone brown
    'build-nov-2024.jpg':    (30,  35,  28),   # forest dusk
}

for filename, (r, g, b) in images.items():
    path = os.path.join(out, filename)
    # Use 1920x1080 for hero/elements, 800x600 for others
    if any(k in filename for k in ['hero', 'earth', 'water', 'fire', 'air']):
        w, h = 1920, 1080
    elif filename.startswith('exp'):
        w, h = 800, 1067   # 3:4 portrait
    elif filename.startswith('room'):
        w, h = 800, 600    # 4:3
    elif filename.startswith('build'):
        w, h = 1280, 720
    else:
        w, h = 1200, 800

    data = make_png(w, h, r, g, b)
    with open(path, 'wb') as f:
        f.write(data)
    print(f'  ✓ {filename}  ({w}×{h}  rgb{r,g,b})')

print(f'\n{len(images)} placeholder images written to {out}/')
print('Replace with real photography before launch.')
