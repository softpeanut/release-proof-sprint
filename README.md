# Release Proof landing page

A dependency-free static landing page for two completed, pseudonymous offers:

- Release Proof Kit v1.0.0: 15,000-sat Personal or 100,000-sat Team license.
- Release Proof Sprint: 100,000-sat fixed scope for one public repository.

The primary CTA links to the live Shopstr kit listing. The page itself has no form,
checkout, script, analytics, or identity collection.

## Preview

From this directory:

```sh
python3 -m http.server 4174
```

Open <http://127.0.0.1:4174/>.

Opening `index.html` directly also works. There is no JavaScript, server-side
application, form submission, cookie, external font, or analytics request.

## Publication status and order boundary

The current main-branch page is published at <https://softpeanut.github.io/release-proof-sprint/>.
This branch replaces the former public issue-interest CTAs with exact kit and service Shopstr
listing URLs. It also warns buyers not to send identity, credentials, private code, customer
data, or payment proof.

The live kit and service listings use the pseudonymous Shopstr merchant already documented in
`kit-terms.md` and `shopstr-terms.md`. An order request is not payment. A compatible Lightning
invoice is issued only after scope/tier confirmation, and delivery begins only after verified
payment. The landing page itself does not collect payment or prove revenue.

## Content contract

- Kit price: 15,000 sats Personal or 100,000 sats Team.
- Service price: 100,000 sats fixed scope.
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

The script uses only shell tools and Python's standard-library HTML parser. It checks local
asset references, exact Shopstr listing links, required offer/privacy language, absence of
scripts/forms/analytics, and the free ShipProof links.
