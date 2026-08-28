# Release Proof Kit — product and license terms

Last updated: August 28, 2026.

Release Proof Kit v1.0.0 is a completed ZIP containing a dependency-free offline CLI, a documentary
JSON Schema, three release examples, five Markdown templates, a checksum manifest, and usage terms.
It requires Node.js 20 or newer and makes no product network call.

## Price and license

- **Personal: 15,000 sats** for one named user.
- **Team: 100,000 sats** for up to 10 named users in one legal organization.

Both tiers receive the same completed files and differ only in license scope. The buyer receives a
non-exclusive, non-transferable, perpetual license to use and adapt the files internally and to use
generated release-evidence output commercially. The source templates, schema, examples, and CLI may
not be redistributed, resold, sublicensed, published, or offered as a competing standalone product.
Generated proof packs and substantially buyer-filled or adapted internal documents are not subject
to that redistribution restriction.

## Delivery and privacy

An order request is not payment. After the selected tier and terms are confirmed, the seller
provides a single-use Lightning invoice for the exact price. Verified purchases are delivered
within one business day through a buyer-only private GitHub repository containing the licensed ZIP,
SHA-256 checksum, and support channel.

Only a GitHub username and selected tier are required. Do not provide a real name, email address,
postal address, phone number, repository URL, release record, evidence pack, source code, customer
data, production data, credential, secret, token, payment proof, or private link. The product runs
on buyer-local files; the seller does not need or request those files.

## Product boundary

The executable validator accepts one regular, non-symlink JSON file of at most 1 MiB, requires 3–7
checks, preserves `pass`, `fail`, and `unverified` evidence, and rejects a `ship` decision unless all
checks pass. The human reviewer may still choose `hold` when all checks pass. The JSON Schema is for
editor integration and does not replace the executable cross-field validation.

The kit records bounded observations. It does not certify security, compliance, production safety,
or the absence of defects, and it does not provide legal, deployment, operational, or release
authorization. The buyer must review every generated artifact and owns the final decision.

## Cancellation, support, and refunds

The buyer may cancel before payment. For a reproducible download or execution defect reported in
the buyer-only repository within seven days, the seller may repair or replace the product. If the
defect cannot reasonably be resolved, an approved refund is returned to a compatible Lightning
invoice supplied by the buyer. Mandatory consumer protections and applicable law remain controlling.
