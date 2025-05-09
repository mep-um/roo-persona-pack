---
tags: [AWS‑Evidence]
---
# Automated Evidence Collection Plan
| Control Category | Evidence Type | Collection Tool |
|------------------|--------------|-----------------|
| IAM Policies | JSON export of roles (AWS IAM) | script/iam‑snapshot.sh |
| Encryption at Rest | KMS key policy screenshot | script/kms‑evidence.sh |
| Incident Response | PagerDuty log export, NIST 800‑61 alignment [NIST80061] | script/ir‑logs.sh |
