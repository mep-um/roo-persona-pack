---
tags: [AWSRel, RPO, K8sReady]
---
# Reliability Checklist

| Area | Target | Notes |
|------|--------|-------|
| **Availability** | 99.97 % monthly | Mirrors Google SRE guidance [AWSRel] |
| **RPO** | ≤ 1 hour | Backup & replica lag [RPO] |
| **RTO** | ≤ 1 hour | Automated fail‑over scripts |
| **K8s** | HA control‑plane, PodDisruptionBudgets [K8sReady] |
| **Capacity** | Auto‑scale at 70 % utilisation (AWS best practice) |
