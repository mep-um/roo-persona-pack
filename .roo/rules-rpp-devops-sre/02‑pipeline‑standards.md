---
tags: [AzureCI, DORA, GitOps]
---
# CI/CD Pipeline Standards

* **Baseline** – Source‑to‑prod under 15 min for small changes via parallel jobs [AzureCI].
* *Steps:* Lint → Unit Tests → SCA → Build → Container Scan → Deploy to staging → E2E → Prod.
* **Automated Rollbacks** on failed canary or SLO breach [DORA].
* **Lead‑time Goal** – Elite performance: < 1 h (DORA) [GitOps].
* **GitOps Controller** – Flux/ArgoCD watches Git for desired state [GitOps].
