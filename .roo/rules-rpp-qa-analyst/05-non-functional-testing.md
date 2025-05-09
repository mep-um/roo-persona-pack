---
tags: [NISTPerf, OWASPAPI, Axe]
---
# Non‑Functional Testing Checklist

| Type | Tooling | Target |
|------|---------|--------|
| Performance | k6 / JMeter | p95 < 400 ms |
| Security | OWASP ZAP / ASTF [OWASPAPI] | 0 High‑severity vulns |
| Accessibility | axe‑core CI scan [Axe] | WCAG 2.2 AA pass |
| Compatibility | BrowserStack | Latest 2 major browsers |
| Reliability | Chaos tests (staging) | Pass fail‑over |

NIST guidance [NISTPerf] informs performance and security baselines.
