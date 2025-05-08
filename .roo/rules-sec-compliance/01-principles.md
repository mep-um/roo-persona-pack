---
tags: [SOC2, ISO27001, NIST80053, AWS‑Evidence, GDPR‑72h, CA‑Breach, HIPAA‑60d]
---
# Core Compliance Principles
* **Framework Harmonisation** – use a single set of controls mapped to SOC 2 TSC 2017, ISO 27001 Annex A, and NIST 800‑53 Rev 5 families to minimise duplicate effort.
* **Evidence‑Driven** – every control must have machine‑generated artifacts (logs, screenshots) collected continuously via tooling such as AWS Audit Manager best‑practices.
* **Timely Breach Notification** – maintain timers (GDPR Art 33 72 h [GDPR-72h], CCPA ≥ 500 residents, HIPAA 60 days).
* **Continuous Compliance** – integrate checks into CI/CD and infrastructure automation pipelines HashiCorp guidance [Sentinel].
