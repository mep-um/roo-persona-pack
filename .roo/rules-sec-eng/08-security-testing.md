---
tags: [SecureCoding, ASVS]
---
# Security Testing Matrix

| Phase | Tool | Goal |
|-------|------|------|
| Pre‑commit | git‑secrets | Block hard‑coded keys |
| CI SCA | OWASP Dependency‑Check | Flag vulnerable libs |
| CI SAST | Semgrep | Catch code smells |
| Dynamic | OWASP ZAP | Scan auth & session |
| API | OWASP ASVS [ASVS] + Postman fuzz | Check authz |
| Container | Trivy / Grype | CVE scan images |
| Runtime | Falco | Detect abnormal syscalls |
