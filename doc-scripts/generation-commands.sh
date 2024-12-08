
echo Generating gallery "Standard"
gallerator --name-of-gallery Standard --gallery standard-gallery media

echo Generating gallery "Recursive"
gallerator --name-of-gallery Gallery --gallery recursive-gallery media \
    --recursive

echo Generating gallery "Pagination"
gallerator --name-of-gallery Pagination --gallery pagination-gallery media \
    --pagination 20

echo Generating gallery "Auto grid"
gallerator --name-of-gallery Auto-grid --gallery auto-grid-gallery media \
    --auto-grid

echo Generating gallery "Nameless auto-grid"
gallerator --name-of-gallery "Nameless auto-grid" --gallery nameless-auto-grid-gallery media \
    --auto-grid --no-filename-captions

echo Generating gallery "3x3 Grid"
gallerator --name-of-gallery "3x3 grid" --gallery grid-gallery media \
    --grid 3x3
