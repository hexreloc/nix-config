{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    xwayland.enable = true;

    systemd.enable = true;

    extraConfig = builtins.readFile ../../config/hypr/hyprland.conf;
  };

  home.packages = with pkgs; [
    kitty
    tofi
    nautilus
    firefox
    obsidian
    hyprpicker
    hypridle
    hyprlock
    wlogout
    waybar
    dunst
    awww
    wl-clipboard
    cliphist
    grimblast
    pamixer
    playerctl
    brightnessctl
    kdePackages.polkit-kde-agent-1
  ];

  home.file.".config/hypr/hypridle.conf".source =
    ../../config/hypr/hypridle.conf;

  home.file.".config/hypr/hyprlock.conf".source =
    ../../config/hypr/hyprlock.conf;
} 
