## 2024-05-18 - Visual Contrast for Terminal Prompts
**Learning:** Adding colored text to terminal prompts improves visibility significantly against large blocks of uncolored or differently colored text (like `git diff`), acting as a "stop sign" to catch the user's attention.
**Action:** Use ANSI color codes (e.g., yellow `\033[1;33m`) for critical terminal prompts where user input or confirmation is required, especially after commands that produce extensive output.
