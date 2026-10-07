{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
  ];

  nixpkgs.config.allowUnfree = true;

  # programs.dconf.enable = true;

  services.upower.enable = true;
  services.power-profiles-daemon.enable = false;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    wget
    git
    curl
    btop
    brightnessctl
    pamixer
    xclip
    pkgs.nvtopPackages.full
    powertop
    dconf
    lm_sensors
    docker-compose
    xinit
    man-pages
    man-pages-posix
  ];

  swapDevices = [
    {
      device = "/swapfile";
      size = 8 * 1024;
    }
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  nix.optimise.automatic = true;

  virtualisation.docker = {
    enable = true;
  };

   services.flatpak.enable = true;
   xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common.default = [ "gtk" ];
    };
  };

  system.stateVersion = "26.05";
}
