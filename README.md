# Dotfiles

<h3 align="center">
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" width="100" alt="Logo"/><br/>
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
	Catppuccin-friendly
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
</h3>

<h6 align="center">
  <a href="http://ipa-reader.xyz/?text=%CB%8Ck%C3%A6tp%CA%8A%CB%88t%CA%83i%CB%90n">/ˌkætpʊˈtʃiːn ˈfɹɛndli/</a>
</h6>

<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="400" />
</p>

This repository contains system configuration files managed using GNU Stow.

## Overview

This configuration includes setup for Zsh, Starship, and various modern CLI tools, utilizing the Catppuccin theme where possible.

## Configured Apps

The following applications are configured in this repository:

- **zsh**: The Z shell, configured with `zinit` for plugin management.
- **starship**: Cross-shell prompt.
- **bat**: A cat clone with syntax highlighting and Git integration.
- **btop**: A resource monitor that shows usage and stats for processor, memory, disks, network and processes.
- **eget**: A tool for easily installing pre-built binaries from GitHub.
- **fastfetch**: A neofetch-like tool for fetching system information and displaying it prettily.
- **ghostty**: A wrapper for the Ghostty terminal emulator configuration.
- **micro**: A modern and intuitive terminal-based text editor.
- **tealdeer**: A fast implementation of tldr, a simplified man page client.
- **zoxide**: A smarter cd command that remembers your most frequently used directories.
- **fzf**: A command-line fuzzy finder.
- **ripgrep**: A line-oriented search tool that recursively searches the current directory for a regex pattern.
- **eza**: A modern replacement for ls.
- **duf**: Disk Usage/Free Utility - a better 'df' alternative.
- **dust**: A more intuitive version of du in rust.
- **ouch**: Painless compression and decompression for your terminal.

## Functions

Custom functions defined in configuration files (primarily `.config/aliases.sh` and `.zshrc`):

- **rebuild**: Handles NixOS system rebuilding. It updates flake inputs (optional), formats files with `alejandra`, shows a git diff, runs `nixos-rebuild switch`, commits the changes to git with the generation name, and shows a package diff using `nvd`.
- **backup `<filename>`**: Creates a backup of the specified file by appending `.backup` to its name.
- **create `<path>`**: Creates a file and any necessary parent directories.
- **ligatures**: Prints a test pattern to verify font ligatures in the terminal.
- **setup_software**: Checks for the existence of `~/Software`, installs `eget` if missing, and then uses `eget` to install or update all tools defined in `.config/eget/eget.toml`.

## Dependencies

The configuration (aliases and shell functions) relies on the following tools being available on the system:

- **eza**: Used for `ls`, `l`, and `tree` aliases.
- **bat**: Used for `cat` alias.
- **duf**: Used for `df` alias.
- **dust**: Used for `du` alias.
- **fd**: Used for `find` alias.
- **uutils-coreutils**: Used for `xargs`, `locate`, `updatedb`, `diff`, `cmp`, `diff3`.
- **ripgrep**: Used for `grep` alias.
- **micro**: Set as the default `EDITOR`.
- **zoxide**: Initialized in `.zshrc`.
- **fzf**: Initialized in `.zshrc`.
- **starship**: Initialized in `.zshrc`.

## Eget and Remote Server Setup

`eget` is used to manage binary installations, particularly useful on remote servers where you might not have root access or want to install tools locally.

### Remote Server Setup Guide

1.  **Clone the repository**:
    ```sh
    git clone https://github.com/kirilledition/Dotfiles.git ~/Dotfiles
    ```

2.  **Navigate to the directory**:
    ```sh
    cd ~/Dotfiles
    ```

3.  **Source the aliases to make `setup_software` available** (temporarily, before full stow):
    ```sh
    source .config/aliases.sh
    ```

4.  **Run the setup function**:
    ```sh
    setup_software
    ```
    This will:
    - Create `~/Software` if it doesn't exist.
    - Download and install `eget` into `~/Software` if not present.
    - Read `.config/eget/eget.toml` and install all defined tools (bat, fzf, zoxide, etc.) into `~/Software`.

5.  **Add Software to PATH**:
    Ensure the software directory is in your PATH by adding the following to your shell configuration (already included in `.zshrc` in this repo):
    ```sh
    export PATH="$HOME/Software:$PATH"
    ```

6.  **Apply Dotfiles**:
    Use `stow` to symlink configurations:
    ```sh
    stow .
    ```

## Inspiration
I took most of my configuration from following repositories:
- [LilDojd dotfiles](https://github.com/LilDojd/dotfiles)
- [Dreams Of Autonomy Zsh](https://github.com/dreamsofautonomy/zensh)
- [Catppuccin color scheme](https://github.com/catppuccin)
