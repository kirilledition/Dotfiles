# Palette's Journal

## 2026-02-27 - Preventing Data Loss in CLI Tools
**Learning:** Users often assume backup commands are non-destructive. Silently overwriting files violates this trust and can lead to unrecoverable data loss.
**Action:** When implementing file operations that might overwrite existing data, always check for existence first. If a conflict exists, either prompt the user or default to a non-destructive alternative (like appending a timestamp), and inform the user of the action taken.
