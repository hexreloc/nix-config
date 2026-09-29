{
  imports = [
    ./colors.nix
  ];

  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        size = 16.0;
        normal = {
          family = "Iosevka";
        };

        bold = {
          family = "Iosevka";
        };

        italic = {
          family = "Iosevka";
        };
      };
      window.opacity = 1;
    };
  };
}
