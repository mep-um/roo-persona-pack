---
tags: [AES256, NIST80063]
---
# Encryption Standards

| Layer | Algorithm | Notes |
|-------|-----------|-------|
| Data‑at‑Rest | AES‑256‑GCM | NIST FIPS‑197 compliant [AES256] |
| Data‑in‑Transit | TLS 1.3 | Disable weak ciphersuites |
| Password Hashing | Argon2id | NIST 800‑63B adaptive compliance [NIST80063] |
| Key Management | KMS + envelope encryption | Rotate annually |
