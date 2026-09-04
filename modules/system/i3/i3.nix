{pkgs, ...}:
{
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      dmenu
    ];
    configFile = ../../../config/i3/config;
  };
}
