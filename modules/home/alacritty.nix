{
  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        normal = {
          family = "Iosevka Nerd Font";
        };

        bold = {
          family = "Iosevka Nerd Font";
        };

        italic = {
          family = "Iosevka Nerd Font";
        };
      };
      window.opacity = 0.8;

      colors = {
        primary = {
          background = "#000000";
          foreground = "#bcbcbc";
        };

        normal = {
          black   = "#000000";
          red     = "#cc5555";
          green   = "#55aa55";
          yellow  = "#cdcd55";
          blue    = "#5555cc";
          magenta = "#cc55cc";
          cyan    = "#55aaaa";
          white   = "#aaaaaa";
        };

        bright = {
          black   = "#555555";
          red     = "#ff5555";
          green   = "#55ff55";
          yellow  = "#ffff55";
          blue    = "#5555ff";
          magenta = "#ff55ff";
          cyan    = "#55ffff";
          white   = "#ffffff";
        };
      };
    };
  };
}
