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
    emacs
    symbola
    pandoc
    shellcheck


    fd
    code-cursor
    obsidian
    alacritty-theme
    readest
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
    gcc
    cmake
    python3
    obs-studio
    mpv
  ];
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.stateVersion = "25.11";
}
