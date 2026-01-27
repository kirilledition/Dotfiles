# 📂 Dotfiles

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

This repository contains my system configuration files, managed using GNU Stow for easy management of Unix user configuration files.

## Overview

- **Zsh setup**: Utilizes the zinit plugin system, which is automatically downloaded.
- **Configuration files**: Includes configurations for zsh, bat, lsd, aliases, and git.

## Setup

### Requirements

```
stow starship zoxide fzf eza bat ripgrep unar duf dust micro fastfetch
```

## Enable Dotfiles

To enable the dotfiles, navigate to the repository directory and run:
```sh
cd ~/Dotfiles
stow .

bat cache --build 
fast-theme XDG:catppuccin-mocha
```

By following the setup instructions, you can quickly apply these configurations to your system, ensuring a consistent and personalized development environment. 🚀

## Inspiration
I took most of my configuration from following repositories:
- [LilDojd dotfiles](https://github.com/LilDojd/dotfiles)
- [Dreams Of Autonomy Zsh](https://github.com/dreamsofautonomy/zensh)
- [Catppuccin color scheme](https://github.com/catppuccin)
