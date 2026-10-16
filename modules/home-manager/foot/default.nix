{ ... }:

{
  programs.foot = {
    enable = true;

    settings = {
      main = {
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
