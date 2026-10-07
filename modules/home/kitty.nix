{ pkgs, ... }:

{
  home.packages = [
    pkgs.kitty
  ];

  home.file.".config/kitty/kitty.conf".source =
    ../../config/kitty/kitty.conf;

  home.file.".config/kitty/theme.conf".source =
    ../../config/kitty/theme.conf;
}
