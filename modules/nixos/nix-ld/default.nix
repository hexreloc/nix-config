{pkgs, ...}:
{
   programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [
      libXxf86vm
      alsa-lib

      # JavaFX/X11 dependencies
      libX11
      libXext
      libXi
      libXrender
      libXrandr
      libXtst
      libxcb
      libGL
      libGLU
    ];
  };
}
