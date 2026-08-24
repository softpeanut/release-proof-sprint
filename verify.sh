#!/bin/sh
set -eu

cd "$(dirname "$0")"

test -s index.html
test -s styles.css
test -s README.md

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
    "$129 pilot",
    "one active slot",
    "No payment is being collected.",
    "3-business-day delivery target",
    "Starts only after scope and safe access materials are complete and accepted.",
    "Production credentials or production access",
    "Paid infrastructure or purchases",
    "Security certification or compliance advice",
)
for phrase in required_copy:
    assert phrase in html, phrase

issue_prefix = "https://github.com/softpeanut/release-proof-sprint/issues/new?"
issue_links = [link for link in parser.links if link.startswith(issue_prefix)]
assert len(issue_links) == 2, issue_links
for link in issue_links:
    assert "Scope%20interest" in link
    assert "Do%20not%20include%20secrets" in link

assert "https://softpeanut.github.io/shipproof/" in parser.links
assert "https://github.com/softpeanut/shipproof" in parser.links

for forbidden in ("google-analytics", "googletagmanager", "plausible.io", "segment.com"):
    assert forbidden not in html.lower(), forbidden

print(f"ok: {len(parser.links)} links, {len(issue_links)} scope-interest CTAs, no script/form")
PY

printf '%s\n' "ok: static landing verification passed"
