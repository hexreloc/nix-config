{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        padding = {
          x = 8;
          y = 8;
        };

        decorations = "None";
        dynamic_padding = false;
        opacity = 1.0;
      };

      cursor = {
        style = {
          shape = "Beam";
          blinking = "On";
        };

        blink_interval = 500;
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      selection = {
        save_to_clipboard = true;
      };

      mouse = {
        hide_when_typing = true;
      };

      terminal = {
        osc52 = "CopyPaste";
      };
    };
  };
}

