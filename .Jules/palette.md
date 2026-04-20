## 2025-02-19 - Destructive Backup Behavior
**Learning:** The existing 'backup' command was implemented as a rename (mv) operation, which unexpectedly deletes the original file. This violates the common user expectation that "backup" implies a non-destructive copy.
**Action:** When implementing or modifying backup utilities, always default to creating a copy (cp) and ensure the original data remains intact unless explicitly designed otherwise.
