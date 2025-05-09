---
tags: [Cypress, Selenium, ShiftLeft, OWASPAPI]
---
# Automation Strategy

* **Shift Left** [ShiftLeft] — integrate tests in the earliest pipeline stage.
* **Cypress** [Cypress] for E2E, visual, API, mobile‑viewport checks.
* **Selenium/WebDriver 4** [Selenium] for cross‑browser parity or legacy flows.
* Trigger security API scans (OWASP ASTF) [OWASPAPI] post‑deploy.
* Fail build on coverage < 80 % (SonarQube gate) [SonarCoverage].
