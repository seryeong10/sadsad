# A-VATA shopping image import

The actual catalog is `backend/data/shopping_products.json`, copied from the
supplied `avata_shopping_products.json`. Its original product links, null prices,
and `availability_verified: false` are retained.

No product photos have been acquired. UNIQLO's online-store terms, article 22(1),
require prior consent for use of product photographs. The provided data contains
no consent record. A public image URL or a screenshot is not treated here as a
license. The request specifically requires permitted use and no access bypass.

Terms checked in the browser on 2026-11-12:
https://faq-kr.uniqlo.com/pkb_Home_UQ_KR?id=kA0Ie000000TO0f&l=ko

## Once matching photographs are authorized

Record real evidence in `deployment/shopping-image-permissions.json`:

```json
{
  "female_top_01": {
    "source": "path/to/approved-photo.jpg",
    "permission": "owned",
    "permission_basis": "Actual evidence covering app display, resizing and AI try-on use",
    "product_match_verified": true,
    "product_url": "EXACT original product_url from the catalog"
  }
}
```

`licensed` can be used instead of `owned` when permission has actually been
obtained. Merely setting these fields does not grant rights. Check the product
name, product number and selected color against the real photograph first.

Run a review, then import:

```powershell
backend/.venv/Scripts/python.exe deployment/import-shopping-images.py --manifest deployment/shopping-image-permissions.json
backend/.venv/Scripts/python.exe deployment/import-shopping-images.py --manifest deployment/shopping-image-permissions.json --apply
```

Approved imports are normalized to 512x512 RGB PNGs on a white background with
preserved aspect ratio and padding, saved as
`frontend/assets/shopping_products/<product_id>.png`. Only successful records
receive `image_url: assets/shopping_products/<product_id>.png`. Prices and product
detail URLs are never inferred or changed. Failed items are not substituted.

HTTPS downloads check robots policy, identify the importer honestly, and stop on
denied access or redirects requiring another source review. No cookies, proxy
rotation, CAPTCHA handling or browser impersonation are used.

Rebuild the Flutter web assets and redeploy the updated backend catalog after
import. Existing wishlist JSON preserves asset paths. Thumbnail rendering uses
`Image.asset`; fitting loads the same asset bytes and sends a PNG data URI. Local
paths are never sent to fal.ai as if they were public URLs. Missing images keep
the existing missing-photo message and do not trigger a fitting request.
