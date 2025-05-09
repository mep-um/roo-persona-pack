---
tags: [DockerTop10, Snyk]
---
# Container Security Controls

1. **OWASP Docker Top 10** – Enforce controls like rootless containers & image provenance [DockerTop10].
2. **Image Scans** – Automate Snyk or Trivy scans in CI [Snyk].
3. **Least‑Privilege** – Drop all capabilities except required set, restrict network.
4. **Prod Registry Signing** – Enable cosign signatures validated in admission webhooks.
