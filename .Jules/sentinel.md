# Sentinel Journal

This journal tracks critical security learnings, vulnerability patterns, and architectural gaps discovered during development.

## 2024-05-23 - Initial Sentinel Setup
**Vulnerability:** N/A (Initial Setup)
**Learning:** Establishing a security journal ensures learnings are captured and not repeated.
**Prevention:** Regular review of this journal.

## 2024-05-23 - SSH Root Login Enabled
**Vulnerability:** Root login was explicitly enabled via SSH (`PermitRootLogin = "yes"`), allowing direct access to the root account.
**Learning:** Default configurations or copy-pasted settings can inadvertently re-enable insecure defaults even when other measures (like disabling password auth) are taken.
**Prevention:** Regularly audit `configuration.nix` for critical security flags like `PermitRootLogin`, ensuring they match the intended policy (default deny).
