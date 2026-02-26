## 2024-05-22 - [Audit-Before-Apply Pattern]
**Vulnerability:** System rebuilds applied changes automatically without review, risking breakage or malicious changes.
**Learning:** Automated configuration management needs a human-in-the-loop verification step before privileged execution (sudo).
**Prevention:** Force interactive confirmation (read -r) after displaying diffs but before executing system changes.
