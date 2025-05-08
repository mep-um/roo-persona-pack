---
tags: [Axe, NVDA, WCAG22]
---
# Accessibility Testing Workflow

1. **Automated scan** — axe‑core CI; fail build on Critical violations [Axe].
2. **Screen reader smoke** — NVDA key path check / VoiceOver on macOS.
3. **Keyboard walkthrough** — follow checklist #04.
4. **Manual review** — colour / cognition heuristics (COGA).
5. **Assistive tech matrix** verified at least after every major release (NVDA, JAWS, TalkBack).