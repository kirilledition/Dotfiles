## 2026-02-26 - Smart Backup Filenaming
**Learning:** Users expect backup commands to be non-destructive. Overwriting previous backups without warning creates anxiety and potential data loss. Adding automatic timestamping when a collision occurs transforms a risky operation into a safe, versioned history.
**Action:** When creating file manipulation utilities, always check for existence of the target and prefer creating unique versions over silent overwrites.
