---
tags: 	[ErrorGuides, ProgDisclosure]
---

# Error Message Framework

> **Pattern:** *What happened* + *Why* (optional) + *How to fix*.

*Example*: “Payment failed because the card was declined. Try another card or contact your bank.”

Guidelines:  
* Keep language blame‑free and constructive (NN Heuristic #9). [ErrorGuides]
* Provide a clear recovery action or next step.
* If technical detail is helpful, nest it under a “Show details” disclosure. [ProgDisclosure]
* Avoid codes unless audience is technical; otherwise surface them in logs.
