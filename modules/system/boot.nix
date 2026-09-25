{...}:
{
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	nix.settings.experimental-features = [
	  "nix-command"
	  "flakes"
    ];

    boot.plymouth.enable = true;
    boot.kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      "systemd.show_status=false"
      "rd.systemd.show_status=false"
  ];
}
