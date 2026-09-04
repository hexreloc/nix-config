{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    nerd-fonts.iosevka
    hack-font
  ];
}
