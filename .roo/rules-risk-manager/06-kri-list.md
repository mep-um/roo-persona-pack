---
tags: [KRI]
---

# Key Risk Indicators

| KRI | Threshold | Linked Risk | Notes |
|-----|-----------|-------------|-------|
| Weekly failed login count > 2x baseline avg | Alert | RM-002 | Requires tracking baseline login failures. Adapts to usage changes |
| Critical vulnerabilities > 0 | High Priority / Immediate Review | RM-003 | Triggers immediate assessment, even if patching takes a few days |
| High severity vulnerabilities > 1 unpatched > 14 days | Alert | RM-003 | Stricter than original, focuses on getting count down quickly |

KRIs are gauges of exposure per Risk.net definition [KRI].
