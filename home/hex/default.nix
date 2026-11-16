{ pkgs, ... }:

let
  homeModules = import ../../modules/home-manager;
in
{
  stylix.overlays.enable = false;
  home.username = "hex";
  home.homeDirectory = "/home/hex";

  imports = builtins.attrValues homeModules;

  home.packages = with pkgs; [

    #mardkownbegin
    pandoc
    #mardkownend

    # latexstuffsbegin
    mupdf
    texliveFull
    # latexstuffsend

    #prgramstuffbegin
    gcc16
    gdb
    cmake
    python3
    #prgramstuffend

    ghostty
    gammastep
    emacs
    telegram-desktop
    fd
    obsidian
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
    obs-studio
    mpv
    nautilus
    qbittorrent
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.stateVersion = "25.11";
}
