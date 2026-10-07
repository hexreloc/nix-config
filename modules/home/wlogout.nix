{ pkgs, ... }:

{
  home.packages = [
    pkgs.wlogout
  ];

  home.file.".config/wlogout/layout".source =
    ../../config/wlogout/layout;

  home.file.".config/wlogout/style.css".source =
    ../../config/wlogout/style.css;
}
