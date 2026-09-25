 { config, pkgs, lib, ... }:

let
  flavor = "mocha";
  accent = "mauve";
  flavorCap = "Mocha";
  accentCap = "Mauve";
  gtkThemeName = "Catppuccin-${flavorCap}-Standard-${accentCap}-Dark";
  cursorThemeName = "Catppuccin-${flavorCap}-${accentCap}-Cursors";
  iconThemeName = "Papirus-Dark";
  cursorSize = 24;
in
{
  gtk = {
    enable = true;

    theme = {
      name = gtkThemeName;
      package = pkgs.catppuccin-gtk.override {
        accents = [ accent ];
        size = "standard";
        variant = flavor;
      };
    };

    iconTheme = {
      name = iconThemeName;
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = flavor;
        accent = accent;
      };
    };

    cursorTheme = {
      name = cursorThemeName;
      package = pkgs.catppuccin-cursors.${flavor + accentCap};
      size = cursorSize;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4 = {
      theme = config.gtk.theme;
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };
  };

  home.pointerCursor = {
    name = cursorThemeName;
    package = pkgs.catppuccin-cursors.${flavor + accentCap};
    size = cursorSize;
    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    GTK_THEME = gtkThemeName;
    NIXOS_OZONE_WL = "1";
    XCURSOR_THEME = cursorThemeName;
    XCURSOR_SIZE = toString cursorSize;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = gtkThemeName;
      icon-theme = iconThemeName;
      cursor-theme = cursorThemeName;
      cursor-size = cursorSize;
    };
  };
}
