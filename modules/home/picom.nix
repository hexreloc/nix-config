{ ... }:
{
  services.picom = {
    enable = false;
    backend = "glx";
    fade = true;
    fadeDelta = 10;
    fadeSteps = [ 0.04 0.04 ];
    shadow = true;
    shadowOpacity = 0.75;
    settings = {
      blur = {
        method = "gaussian";
        size = 10;
        deviation = 5.0;
      };
    };
  };
}   
