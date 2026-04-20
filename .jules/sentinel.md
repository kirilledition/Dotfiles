## 2024-05-22 - [Audit-Before-Apply Pattern]
**Vulnerability:** System rebuilds applied changes automatically without review, risking breakage or malicious changes.
**Learning:** Automated configuration management needs a human-in-the-loop verification step before privileged execution (sudo).
**Prevention:** Force interactive confirmation (read -r) after displaying diffs but before executing system changes.

## 2026-02-26 - [Secure Remote Script Execution]
**Vulnerability:** Use of `curl URL | sh` allows execution of partial downloads or error pages (e.g., 404 HTML) as shell scripts if the connection fails or is interrupted.
**Learning:** Piping network output directly to a shell bypasses file integrity checks and error handling mechanisms.
**Prevention:** Always download to a temporary file, verify the exit code of the download command (using `curl -sSf`), and only then execute the script.
