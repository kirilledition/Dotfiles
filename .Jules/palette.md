# Palette's Journal

## 2024-05-22 - CLI Safety Confirmation
**Learning:** System rebuild scripts run destructively without confirmation, risking unintended changes.
**Action:** Implement explicit `read` prompts after displaying changes (diffs) to allow user verification before execution. Use ANSI colors for visibility.
