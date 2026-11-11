# Shopping product link check

Checked: 2026-11-12 (KST). All 60 supplied product detail pages were confirmed: 53 through public page retrieval, and the other 7 through direct browser navigation and product headings. No broken product link was confirmed. Availability remains unverified for every product.

## Initially inaccessible links: all resolved by browser verification

| ID | Product | URL | Result |
|---|---|---|---|
| female_bottom_07 | 플리츠스커트 | [Product page](https://www.uniqlo.com/kr/ko/products/E488083-000/00?colorDisplayCode=09) | Product page confirmed in browser |
| female_outer_09 | 리버서블다운쇼트재킷 | [Product page](https://www.uniqlo.com/kr/ko/products/E487424-000/00?colorDisplayCode=01) | Product page confirmed in browser |
| male_top_04 | 소프트니트후리스크루넥T | [Product page](https://www.uniqlo.com/kr/ko/products/E479791-000/00?colorDisplayCode=18) | Product page confirmed in browser |
| male_bottom_01 | 스트레이트진 | [Product page](https://www.uniqlo.com/kr/ko/products/E487206-000/00?colorDisplayCode=67) | Product page confirmed in browser |
| male_bottom_02 | 스트레이트진 셀비지 | [Product page](https://www.uniqlo.com/kr/ko/products/E488684-000/00?colorDisplayCode=69) | Product page confirmed in browser |
| male_bottom_06 | 슬림스트레이트진 | [Product page](https://www.uniqlo.com/kr/ko/products/E482856-000/00?colorDisplayCode=67) | Product page confirmed in browser |
| male_outer_05 | 라이트다운볼륨재킷 | [Product page](https://www.uniqlo.com/kr/ko/products/E492179-000/00?colorDisplayCode=56) | Product page confirmed in browser |

## Images and prices

The original link-only JSON has now been supplemented by the user's ZIP containing 60 matching product photographs. All 60 are shipped as local 512×512 assets and passed as image bytes to fitting. See SHOPPING_IMAGE_REPORT.md for photo review notes. Prices remain absent and are not invented; original product URLs and unverified availability flags are preserved.

## Verification scope

Successful page retrieval was checked against each product page title. It is not a stock check or a guarantee of future availability. The original product URLs and `availability_verified: false` are preserved. Direct HTTP checking on the local PC timed out. Public page retrieval and direct browser navigation were used instead; browser navigation resolved all seven initial verification failures.

## Same-name entries

female_top_08 and female_top_09 have matching display names but different supplied product URLs/product numbers. They are retained as separate source entries; IDs and exact URLs are deduplicated in each recommendation.
