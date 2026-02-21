## 2024-12-16 - Destructive Backup Aliases
**Learning:** Shell functions named "backup" create an expectation of redundancy (copying), but may be implemented as `mv` (moving/renaming). This mismatch between mental model and implementation can lead to accidental data loss or unexpected file deletion.
**Action:** When auditing shell configurations, verify that "backup" commands use `cp` (copy) rather than `mv` (move), and include confirmation prompts before overwriting existing backups.
