{
  config,
  pkgs,
  ...
}: {
  services.xserver = {
    enable = true;
    windowManager.openbox.enable = true;
  };
  services.displayManager.ly.enable = true;
  environment.systemPackages = with pkgs; [
    openbox
    rofi
    firefox
    xterm
    feh
    xorg.xset
    gammastep
    libxml2
    pamixer
    brightnessctl
    networkmanager
    lm_sensors
    upower
    kitty
  ];

  services.printing.enable = true;
}
