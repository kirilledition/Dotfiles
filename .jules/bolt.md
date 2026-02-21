## 2026-02-21 - [Zsh Startup Optimization]
**Learning:** Synchronous `compinit` execution in `.zshrc` adds significant latency to shell startup (often 50-200ms+ depending on $fpath size).
**Action:** Use a conditional check on `.zcompdump` age (e.g., 24h) to run `compinit -C` (skip security checks) for faster subsequent startups.
