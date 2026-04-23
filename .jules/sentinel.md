## 2024-05-22 - [Audit-Before-Apply Pattern]
**Vulnerability:** System rebuilds applied changes automatically without review, risking breakage or malicious changes.
**Learning:** Automated configuration management needs a human-in-the-loop verification step before privileged execution (sudo).
**Prevention:** Force interactive confirmation (read -r) after displaying diffs but before executing system changes.

## 2026-02-28 - [Insecure Remote Script Execution Pattern]
**Vulnerability:** Using `curl https://... | sh` for software installation allows partial execution if the network fails midway, leaving the system in an unknown or vulnerable state.
**Learning:** Piping curl output directly to a shell bypasses the ability to verify the downloaded content's integrity and completion before execution. It also risks dropping failures silently.
**Prevention:** Download the script to a temporary file (`mktemp`), enforce failure on HTTP errors (`curl -sSf -o temp_file`), verify successful download, and only execute the temporary file afterwards. Finally, delete the temporary file.
