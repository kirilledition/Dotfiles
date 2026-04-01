# BOLT'S JOURNAL - CRITICAL LEARNINGS ONLY
## YYYY-MM-DD - [Title]
**Learning:** [Insight]
**Action:** [How to apply next time]

## 2024-05-22 - NixOS Binary Timestamp & Caching
**Learning:** On NixOS, binaries in the Nix store often have a fixed modification time (1970-01-01). Standard cache invalidation using `[[ cache -nt binary ]]` fails because the cache (created now) is always "newer" than the binary. However, the *path* of the binary changes with every update (e.g., `/nix/store/OLD-pkg/bin` vs `/nix/store/NEW-pkg/bin`).
**Action:** When caching command output on systems that might be NixOS, validate the cache by checking BOTH:
1. `[[ cache -nt binary ]]` (for non-NixOS updates)
2. `[[ "$(head -n1 cache | tr -d '# ')" == "$(command -v binary)" ]]` (for NixOS path-based updates)
