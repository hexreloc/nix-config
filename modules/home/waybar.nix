{ pkgs, ... }:

{
  home.packages = [
    pkgs.waybar
  ];

  home.file.".config/waybar/config.jsonc".source =
    ../../config/waybar/config.jsonc;

  home.file.".config/waybar/style.css".source =
    ../../config/waybar/style.css;
}
