# Shopping product thumbnails

Approved product photographs belong here as `<product_id>.png` (512 x 512,
aspect ratio preserved on a white canvas). No substitute or generated product
images are included.

No UNIQLO photograph has been copied: the official store terms, article 22(1),
require prior consent for use of product photographs. No consent evidence was
provided for this project's 60 products.

Use `deployment/import-shopping-images.py` with a permission and product-match
manifest after obtaining approval or user-owned matching photographs. The JSON
continues to use `image_url: null` until a real approved image is imported.
