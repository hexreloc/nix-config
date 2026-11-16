# Hex's NixOS Configuration

My personal NixOS + Home Manager flake configuration for the **HP Victus** laptop (`hosts/victus`), running as user `hex`.

## Screenshots

Wallpapers included in `wallpapers/`:

- `wallpaper.png`
- `wallpaper2.png`
- `wallpaperx.jpg`
- `wall.jpg`
- `nixos.png`

## System

| | |
|---|---|
| **Host** | `victus` (HP Victus) |
| **User** | `hex` |
| **Session** | Plasma 6 (Wayland), Hyprland (Wayland), Sway, i3 |
| **Terminal** | Alacritty, Kitty, Foot |
| **Editor** | Neovim, Helix |
| **Shell** | Fish |
| **Launcher** | Tofi |
| **Bar** | Waybar |
| **Notifications** | Dunst |
| **Lockscreen** | Hyprlock |
| **Idle** | Hypridle |
| **Compositor effects** | Picom / Sway (alternate sessions) |
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
│   ├── dunst/dunstrc
│   ├── hypr/{hyprland,hypridle,hyprlock}.conf
│   ├── i3/config
│   ├── kitty/{kitty.conf,theme.conf}
│   ├── tofi/{configA,configV}
│   ├── waybar/{config.jsonc,style.css}
│   ├── wlogout/{layout,style.css}
│   └── hpvictusfan/fan.sh
├── modules/
│   ├── home-manager/        # Reusable Home Manager modules
│   │   ├── alacritty, dunst, fish, helix, hyprland, kitty, nvim,
│   │   │   tmux, waybar, wlogout, theme, ...
│   │   └── default.nix
│   └── nixos/               # Reusable NixOS modules
│       ├── audio, boot, desktop, fonts, game, i3, locale,
│       │   network, nvidia, plasma, tlp, users, ...
│       └── default.nix
├── overlays/
│   └── default.nix          # Nixpkgs overlays
├── pkgs/
│   └── default.nix          # Custom packages (`nix build .#<name>`)
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

```bash
nix build .#<package-name>
```

Format Nix code:

```bash
nix fmt
```

## Requirements

- NixOS unstable channel (`nixos-unstable`)
- Flakes enabled (`nix.settings.experimental-features = [ "nix-command" "flakes" ];`)
- Home Manager module enabled via the flake

## Notes

- Stylix is used for color scheme management; themes live in `modules/home-manager/theme/`.
- The Hyprland config launches `dunst`, `waybar`, `hypridle`, and `awww` (animated wallpaper) on session start.
- Plasma 6 uses Plasma Login Manager and defaults to Wayland; choose a different session at the login screen if needed.
- An HP Victus fan control script lives at `config/hpvictusfan/fan.sh`.