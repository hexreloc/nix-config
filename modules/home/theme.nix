{ config,pkgs, ... }:

{
  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 28;
  };

  gtk = {
    enable = true;
    gtk4.theme = config.gtk.theme;

  #   theme = {
  #     name = "Adwaita-dark";
  #     package = pkgs.gnome-themes-extra;
  #   };
   gtk3.extraConfig = {
    gtk-application-prefer-dark-theme = 1;
  };
  gtk4.extraConfig = {
    gtk-application-prefer-dark-theme = 1;
  };
   };

}
