# My NixOS Setup & Dotfiles

This repository contains my personal NixOS configuration, dotfiles, and Linux environment setup. I’ve been using it on my **Lenovo L13 Gen2 (Intel)** laptop as a daily driver for over a month. It’s modular, reproducible, and fully managed with home-manager. Desktop configuration and homelabs are planned next.

## Overview

* **Primary Focus:** Laptop first, desktop next, homelabs in the future
* **Key Skills:** Linux fundamentals, NixOS, automation, reproducible configurations, Docker
* **Environments & Tools:**

  * Window Managers: Hyprland, Niri, Noctalia, KDE, XFCE
  * Terminal & Shell: starship, ghostty, fuzzel, eza
  * Visuals: Custom icons, cursors, themes
* **Approach:** Fully managed with home-manager

## Repository Structure

```
config/      # Dotfiles and app configurations
home/        # Home-manager modules
devices/     # Device-specific NixOS configurations
modules/     # Reusable NixOS modules
pkgs/        # Custom Nix packages
pics/        # Icons and screenshots
flake.nix    # Flake entrypoint
flake.lock   # Flake dependencies
```

## Installation

1. **Install NixOS** on your machine (minimal/basic install).

2. **Clone the dotfiles** into your home directory:

```bash
git clone https://github.com/<your-username>/<repo-name>.git ~/.dotfiles
cd ~/.dotfiles
```

3. **Apply your system configuration** for the Lenovo L13 Gen2 laptop:

```bash
sudo nixos-rebuild switch --flake .#episodecode
```

> This will apply all NixOS modules, device-specific configs, and home-manager settings automatically.

---

This setup demonstrates practical skills in Linux system configuration, automation, and reproducible environments.

