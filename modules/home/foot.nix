{ ... }:

{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=14";
        pad = "10x10";
      };

      scrollback = {
        lines = 5000;
      };

      cursor = {
        style = "block";
      };
    };
  };
}
