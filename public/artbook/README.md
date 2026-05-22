# Artbook images

This directory holds the per-page images for the Artbook gallery.

Run the extraction script from the project root, passing the path to the
source PDF:

    ./scripts/extract-artbook.sh ~/Documents/EconArtbook.pdf

The script writes:

    page-001.jpg       page-001-full.jpg
    page-002.jpg       page-002-full.jpg
    ...

The `.jpg` files are thumbnails for the grid; the `-full.jpg` files are
the larger versions shown in the lightbox.
