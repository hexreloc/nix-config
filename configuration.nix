
{ pkgs, ... }:

{
  imports =
    [  
      ./hardware-configuration.nix
      ./modules/system
    ];
    nixpkgs.config.allowUnfree = true;

    programs.dconf.enable = true;
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
    ];

    swapDevices = [
      {
        device = "/swapfile";
        size = 8 * 1024; # 8 GiB
      }
    ];

  # automatic garbage collection

# Nix
nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 14d";
};

nix.optimise.automatic = true;

#docker 
virtualisation.docker = {
  enable = true;
};


# flatpak
services.flatpak.enable = true;
xdg.portal = {
  enable = true;
  extraPortals = [ 
    pkgs.xdg-desktop-portal-gtk
    #pkgs.xdg-desktop-portal-wlr
  ];
  config.common.default = "*";
};
system.stateVersion = "26.05";

}
