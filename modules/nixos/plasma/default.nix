{ ... }:

{
  services.desktopManager.plasma6.enable = false;

  # Plasma 6 uses Wayland by default. Plasma Login Manager is Wayland-native,
  # unlike Ly, so the Plasma Wayland session starts correctly.
  services.displayManager = {
    plasma-login-manager.enable = false;
    defaultSession = "plasma";
  };
}
