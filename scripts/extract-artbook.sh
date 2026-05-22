#!/usr/bin/env bash
# Extracts each page of the Artbook PDF to two sizes:
#   public/artbook/page-NNN.jpg       (thumbnail, ~800px wide)
#   public/artbook/page-NNN-full.jpg  (lightbox, ~1600px wide)
#
# Requires: pdftoppm (poppler-utils) and ImageMagick.
# macOS:  brew install poppler imagemagick
# Ubuntu: sudo apt install poppler-utils imagemagick
#
# Usage:  ./scripts/extract-artbook.sh path/to/EconArtbook.pdf

set -e

PDF="$1"
if [ -z "$PDF" ]; then
  echo "Usage: $0 path/to/EconArtbook.pdf"
  exit 1
fi
if [ ! -f "$PDF" ]; then
  echo "File not found: $PDF"
  exit 1
fi

OUT="public/artbook"
mkdir -p "$OUT"
TMP=$(mktemp -d)

echo "Rasterising PDF at 200 DPI to $TMP ..."
pdftoppm -jpeg -r 200 "$PDF" "$TMP/page"

echo "Generating thumbnails and full-size images in $OUT ..."
i=1
for f in "$TMP"/page-*.jpg; do
  n=$(printf "%03d" "$i")
  # full-size (lightbox)
  magick "$f" -resize 1600x1600\> -quality 85 "$OUT/page-$n-full.jpg"
  # thumbnail (grid)
  magick "$f" -resize 800x800\>  -quality 80 "$OUT/page-$n.jpg"
  i=$((i+1))
done

rm -rf "$TMP"
echo "Done. Extracted $((i-1)) pages to $OUT."
echo "Update TOTAL_PAGES in src/pages/artbook/index.astro if not 100."
