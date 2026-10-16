{ config, lib, pkgs, ... }:

{
  services.flameshot = {
    enable = true;
    settings.General = {
      useX11LegacyScreenshot = true;
      showStartupLaunchMessage = false;
    };
  };

  systemd.user.services.flameshot.Install.WantedBy = lib.mkForce [];
}
