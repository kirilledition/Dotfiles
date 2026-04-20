# BOLT'S JOURNAL - CRITICAL LEARNINGS ONLY
## YYYY-MM-DD - [Title]
**Learning:** [Insight]
**Action:** [How to apply next time]

## $(date +%Y-%m-%d) - Cached Shell Initialization
**Learning:** Initializing shell tools (like `fzf`, `starship`, and `zoxide`) via subshells (`eval "$(cmd)"`) at startup is a common performance bottleneck in Zsh configurations, resulting in noticeable latency on opening a new terminal.
**Action:** Implemented `_eval_cache` in `.config/aliases.sh` to execute the command once, cache the generated script to `~/.cache/zsh/`, and source the file directly on subsequent loads. Pure Zsh parameter expansion was used for generating the cache key to avoid additional external process calls (like `md5sum`).
