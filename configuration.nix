
{ pkgs, ... }:

{
  imports =
    [  
       ./hardware-configuration.nix
       ./modules/system
    ];
   nixpkgs.config.allowUnfree = true;

   nix.settings.experimental-features = [ "nix-command" "flakes" ];

   environment.systemPackages = with pkgs; [
     wget
     git
     curl
     btop
     brightnessctl
     pamixer
     xclip
   ];

  system.stateVersion = "26.05";

}
