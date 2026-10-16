# Personal home-manager modules, exported through the flake's
# `homeManagerModules` output. Users import them all with
# `builtins.attrValues outputs.homeManagerModules`.
{
  alacritty = import ./alacritty;
  dunst = import ./dunst;
  fastfetch = import ./fastfetch;
  files = import ./files;
  fish = import ./fish;
  flameshot = import ./flameshot;
  foot = import ./foot;
  git = import ./git;
  helix = import ./helix;
  hyprland = import ./hyprland;
  i3status-rust = import ./i3status-rust;
  kitty = import ./kitty;
  nvim = import ./nvim;
  picom = import ./picom;
  sway = import ./sway;
  theme = import ./theme;
  tmux = import ./tmux;
  tofi = import ./tofi;
  waybar = import ./waybar;
  wlogout = import ./wlogout;
}
