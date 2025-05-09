---
tags: [SecureCoding, SANSCWE]
---
# Secure Coding Guidelines

Follow OWASP Secure Coding Practices QRG [SecureCoding] and SANS CWE Top 25 [SANSCWE]:

* Input validation—allow‑lists only.
* Output encoding—context‑aware HTML, SQL, OS.
* Use prepared statements for DB access.
* No secrets in source; inject via vault.
* Implement positive security model for APIs; fail closed.
