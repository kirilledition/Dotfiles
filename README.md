# 📂 Dotfiles

This repository contains my system configuration files, managed using GNU Stow for easy management of Unix user configuration files.

## Overview

- **Zsh setup**: Utilizes the zinit plugin system, which is automatically downloaded.
- **Configuration files**: Includes configurations for zsh, bat, lsd, aliases, and git.

## Setup

### Requirements

#### Mac
To install the necessary packages, run:
```sh
brew install stow starship zoxide fzf lsd bat gh
```

#### Linux
To install the necessary packages on Linux (using `paru`), run:
```sh
paru -S stow starship zoxide fzf lsd bat gh
```

## Enable Dotfiles

To enable the dotfiles, navigate to the repository directory and run:
```sh
cd ~/Dotfiles
stow .

bat cache --build 
```

By following the setup instructions, you can quickly apply these configurations to your system, ensuring a consistent and personalized development environment. 🚀