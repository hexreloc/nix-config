# Personal NixOS modules, exported through the flake's `nixosModules` output.
# Hosts import them all with `builtins.attrValues outputs.nixosModules`.
{
  audio = import ./audio;
  boot = import ./boot;
  desktop = import ./desktop;
  fonts = import ./fonts;
  game = import ./game;
  i3 = import ./i3;
  locale = import ./locale;
  network = import ./network;
  nix-ld = import ./nix-ld;
  nvidia = import ./nvidia;
  # plasma = import ./plasma;
  tlp = import ./tlp;
  users = import ./users;
}
