## 2025-02-18 - Safe Backup Defaults
**Learning:** Users instinctively expect "backup" commands to create a copy, not move the original file. The previous implementation used `mv`, which was destructive and unexpected.
**Action:** When creating file manipulation utilities, always default to non-destructive operations (copy vs move) and implement explicit confirmation for overwrites.
