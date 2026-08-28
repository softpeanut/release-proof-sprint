#!/bin/sh
set -eu

cd "$(dirname "$0")"

test -s index.html
test -s styles.css
test -s README.md
test -s shopstr-terms.md
test -s release-proof-card.svg
test -s kit-terms.md
test -s release-proof-kit-card.svg

python3 - <<'PY'
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import urlparse


class LandingParser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.links = []
        self.scripts = 0
        self.forms = 0
        self.stylesheets = []

    def handle_starttag(self, tag, attrs):
        values = dict(attrs)
        if tag == "a" and "href" in values:
            self.links.append(values["href"])
        elif tag == "script":
            self.scripts += 1
        elif tag == "form":
            self.forms += 1
        elif tag == "link" and values.get("rel") == "stylesheet":
            self.stylesheets.append(values.get("href", ""))


html = Path("index.html").read_text(encoding="utf-8")
parser = LandingParser()
parser.feed(html)

assert parser.scripts == 0, "landing page must not contain scripts"
assert parser.forms == 0, "landing page must not contain forms"
assert parser.stylesheets == ["styles.css"], parser.stylesheets

for stylesheet in parser.stylesheets:
    assert not urlparse(stylesheet).scheme
    assert Path(stylesheet).is_file(), stylesheet

required_copy = (
    "15,000-sat kit",
    "100,000-sat service",
    "One active client slot",
    "An order request is not payment.",
    "GitHub username and tier",
    "3-business-day target",
    "Starts only after scope and safe access materials are complete and accepted.",
    "Production credentials or production access",
    "Paid infrastructure or purchases",
    "Security certification or compliance advice",
)
for phrase in required_copy:
    assert phrase in html, phrase

kit_listing = "https://shopstr.market/listing/naddr1qvzqqqrkcgpzqul3a9tjj4q5kh55hww8h9dnhn3cddnmnhyun5gg48x0w0qyvtd9qy28wumn8ghj7un9d3shjtnyv9kh2uewd9hszrthwden5te0dehhxtnvdakqqfmjv4kx2ctnv5khqun0danz66mfwskk7enxd35kuefdvdkxjtt5v4khqmrpw3jhxha73kd"
kit_links = [link for link in parser.links if link == kit_listing]
assert len(kit_links) == 4, kit_links
service_listing = "https://shopstr.market/listing/naddr1qvzqqqrkcgpzqul3a9tjj4q5kh55hww8h9dnhn3cddnmnhyun5gg48x0w0qyvtd9qy28wumn8ghj7un9d3shjtnyv9kh2uewd9hszrthwden5te0dehhxtnvdakqqfnjv4kx2ctnv5khqun0danz6umswf5kuapdwp6kymrfvvkhyetsdaekjar0wfusmfteap"
service_links = [link for link in parser.links if link == service_listing]
assert len(service_links) == 1, service_links

assert "https://softpeanut.github.io/shipproof/" in parser.links
assert "https://github.com/softpeanut/shipproof" in parser.links

for forbidden in ("google-analytics", "googletagmanager", "plausible.io", "segment.com"):
    assert forbidden not in html.lower(), forbidden

print(
    f"ok: {len(parser.links)} links, {len(kit_links)} exact kit listing links, "
    f"{len(service_links)} exact service listing link, no script/form"
)
PY

python3 - <<'PY'
from pathlib import Path
import xml.etree.ElementTree as ET

terms = Path("shopstr-terms.md").read_text(encoding="utf-8")
required = (
    "100,000 sats",
    "one public GitHub repository",
    "3–7 observable checks",
    "three business days",
    "one revision",
    "compatible Lightning invoice",
    "Do not provide",
    "real name",
    "private repository",
    "production access",
    "customer data",
)
for phrase in required:
    assert phrase in terms, phrase

for forbidden in ("@", "file://", "C:\\"):
    assert forbidden not in terms, forbidden

root = ET.parse("release-proof-card.svg").getroot()
assert root.tag.endswith("svg")
assert root.attrib.get("viewBox") == "0 0 1200 630"

kit_terms = Path("kit-terms.md").read_text(encoding="utf-8")
normalized_kit_terms = " ".join(kit_terms.split())
kit_required = (
    "Personal: 15,000 sats",
    "Team: 100,000 sats",
    "dependency-free offline CLI",
    "buyer-only private GitHub repository",
    "Do not provide",
    "real name",
    "customer data",
    "compatible Lightning invoice",
)
for phrase in kit_required:
    assert phrase in normalized_kit_terms, phrase
for forbidden in ("@", "file://", "C:\\"):
    assert forbidden not in kit_terms, forbidden

kit_root = ET.parse("release-proof-kit-card.svg").getroot()
assert kit_root.tag.endswith("svg")
assert kit_root.attrib.get("viewBox") == "0 0 1200 630"
print("ok: public service/product terms and cards verified")
PY

printf '%s\n' "ok: static landing verification passed"
