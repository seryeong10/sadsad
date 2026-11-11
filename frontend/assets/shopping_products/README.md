# Shopping product thumbnails

60 product PNGs were supplied by the user in avata_shopping_products_60_images.zip.
They are stored by exact product ID and normalized to 512x512 with preserved
aspect ratio on a white canvas. No external image downloads or substitute
product images were used for this import.

The active catalog is backend/data/shopping_products.json. Product detail URLs,
unknown prices and availability_verified=false are preserved. The image report
in backend/data/shopping_image_report.json records input/output checksums.

Some supplied photographs contain a model or multiple garments. Those items
retain the existing fitting-image review step. Existing wishlist entries for the
same curated IDs restore these shipped image paths when their old image was empty.
