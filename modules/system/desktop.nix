{ config, pkgs, ... }: {
  # Enable the X11 windowing system (required by display managers/drivers)
  services.xserver.enable = true;

  # Enable core hardware graphics support
  hardware.graphics.enable = true;

  services.displayManager.ly.enable =  true;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
};

}
