{ pkgs, inputs, ... }:

{
  imports = [
    ../../modules/home
    inputs.zen-browser.homeModules.twilight
  ];

  home.username = "hex";
  home.homeDirectory = "/home/hex";

  programs.zen-browser = {
    enable = true;
  };

  home.packages = with pkgs; [
    fuzzel
    firefox
    pavucontrol
    i3status-rust
    feh
    zathura
    discord
    ripgrep
    mission-center
    yazi
    brave
    fzf
    vim
    rofi
    antigravity-ide
    gcc
    cmake
    python3
    uv
  ];

  home.stateVersion = "25.11";
}
