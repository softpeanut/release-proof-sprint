# Release Proof Sprint landing page

A dependency-free static landing page for a proposed USD 129 Release Proof Sprint
pilot. It intentionally collects no payment. Its primary CTA opens a prefilled,
public scope-interest issue in the planned `softpeanut/release-proof-sprint`
repository.

## Preview

From this directory:

```sh
python3 -m http.server 4174
```

Open <http://127.0.0.1:4174/>.

Opening `index.html` directly also works. There is no JavaScript, server-side
application, form submission, cookie, external font, or analytics request.

## Publication prerequisites

The page is prepared but not published. Before publishing:

1. Obtain the user's approval for the GitHub authenticated actions.
2. Create the planned public `softpeanut/release-proof-sprint` repository.
3. Enable Issues and verify both CTA links open a new issue in that exact repository.
4. Add a short issue policy stating that issues are public and must not contain
   credentials, private code, customer data, or access links.
5. Human-review the offer, turnaround condition, cancellation terms, and public identity.
6. Keep the “No payment is being collected” language until an approved, verified
   Korean payout rail and an actual checkout are ready.

The issue is only an expression of scope interest. It does not reserve the one slot,
create a service agreement, collect payment, or prove revenue.

## Content contract

- Pilot price: USD 129.
- Capacity: one active slot.
- Scope: one critical release path, 3–7 observable checks, one feasible repository-native
  verification contract, pass/fail examples, Markdown handoff, and one revision.
- Delivery target: three business days only after complete scope and safe access
  materials are received and accepted.
- Exclusions: production credentials/access, paid infrastructure, destructive or
  penetration testing, certification/compliance advice, deployment/operations,
  safety guarantees, and unobservable claims.
- Free alternative: public MIT-licensed ShipProof source and live demo.

## Verification

Run:

```sh
./verify.sh
```

The script uses only shell tools and Python's standard-library HTML parser. It checks
local asset references, the required offer language, absence of scripts/forms/analytics,
both planned GitHub issue CTAs, and the free ShipProof links.

