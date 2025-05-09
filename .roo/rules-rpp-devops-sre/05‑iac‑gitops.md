---
tags: [GitOps, DockerTop10, Snyk]
---
# Infrastructure‑as‑Code & GitOps

* **Declarative State** – Terraform/Kustomize manifests tracked in Git [GitOps].
* **Immutable History** – PR‑driven changes, signed commits.
* **Continuous Reconciliation** – Agents pull & apply desired state every 1 min.
* **Security Scans** – Run `tfsec` & OPA policies pre‑merge [DockerTop10].
