# Security‑Compliance – Definition of Ready / Done

**Ready**
- Threat model updated and reviewed with Security Eng.
- Security‑acceptance criteria added to story.
- SOC 2 / ISO 27001 control IDs mapped in `soc2-matrix.xlsx`.
- Incident‑response SOP updated if new attack surface introduced.
- Test cases defined (unit + DAST pipeline).

**Done**
- SAST / SCA / DAST scans pass with zero High/Critical findings.
- No open High/Critical CVEs in dependency tree.
- Encryption, secrets‑handling, CIS benchmarks verified via script.
- Logging & monitoring in place with alert thresholds.
- Evidence archived in `/evidence/<story‑id>/`.
- SOC 2 matrix row marked **Implemented**; control owner sign‑off.
- Breach‑notification drill completed (≤ 2 hr detection + 24 hr response).
