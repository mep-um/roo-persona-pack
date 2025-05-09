---
tags: [ShiftLeft, Cypress, Axe, OWASPAPI]
---
# Continuous Testing Checklist

- [ ] Unit & component tests run on every PR [ShiftLeft].
- [ ] Integration & e2e run on merge to main [Cypress].
- [ ] Daily full‑stack regression in CI nightly build.
- [ ] Accessibility scan in CI → axe‑core [Axe].
- [ ] Security API scan post‑deploy (OWASP ASTF) [OWASPAPI].
- [ ] Performance smoke test in staging → k6.
