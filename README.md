# Hex's NixOS Configuration

My personal NixOS + Home Manager flake configuration for the **HP Victus** laptop (`hosts/victus`), running as user `hex`.

Wallpapers included in `wallpapers/`:

## System

|---|---|
| **Host** | `victus` (HP Victus) |
| **User** | `hex` |
| **Session** | i3 |
| **Terminal** | Alacritty|
| **Editor** | Neovim, Emacs|
| **Shell** | Bash|
| **Launcher** | Rofi |
| **Bar** | i3-status-rs|
| **Graphics** | NVIDIA |
| **Theme engine** | Stylix |

## Directory Structure

```
.
├── flake.nix                # Flake inputs & outputs
├── flake.lock               # Locked input versions
├── .gitignore
├── hosts/
│   └── victus/              # Host-specific NixOS config
│       ├── default.nix
│       └── hardware-configuration.nix
├── home/
│   └── hex/                 # Home Manager user definition
│       └── default.nix
├── config/                  # Static dotfiles (symlinked/copied by Home Manager)
├── modules/
│   ├── home-manager/        # Reusable Home Manager modules
│   └── nixos/               # Reusable NixOS modules
└── wallpapers/              # Wallpaper images
```

## Usage

Apply the system configuration:

```bash
sudo nixos-rebuild switch --flake .#nixos-btw
```

Test without switching:

```bash
sudo nixos-rebuild test --flake .#nixos-btw
```

Build custom packages:

## Requirements
- NixOS unstable channel (`nixos-unstable`)
- Flakes enabled (`nix.settings.experimental-features = [ "nix-command" "flakes" ];`)
- Home Manager module enabled via the flake

## Notes
- Stylix is used for color scheme management; themes live in `modules/home-manager/theme/`.
- The Hyprland config launches `dunst`, `waybar`, `hypridle`, and `awww` (animated wallpaper) on session start.
- Plasma 6 uses Plasma Login Manager and defaults to Wayland; choose a different session at the login screen if needed.
- An HP Victus fan control script lives at `config/hpvictusfan/fan.sh`.
