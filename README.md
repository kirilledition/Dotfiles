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
brew install stow starship zoxide fzf lsd bat gh fastfetch
```

#### Linux
To install the necessary packages on Linux (using `paru`), run:
```sh
paru -S stow starship zoxide fzf lsd bat gh fastfetch
```

## Enable Dotfiles

To enable the dotfiles, navigate to the repository directory and run:
```sh
cd ~/Dotfiles
stow .

bat cache --build 
sudo ln -s /home/$(whoami)/Dotfiles/.config/motd.sh /etc/profile.d/
```

By following the setup instructions, you can quickly apply these configurations to your system, ensuring a consistent and personalized development environment. 🚀

## Inspiration
I took most of my configuration from following repositories:
- [LilDojd dotfiles](https://github.com/LilDojd/dotfiles)
- [Dreams Of Autonomy Zsh](https://github.com/dreamsofautonomy/zensh)
- [Catppuccin color scheme](https://github.com/catppuccin)
