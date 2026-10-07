{ pkgs,... }:

{
    programs.fish.enable = true;
  users.users."hex"= {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "hex";
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "video"
      "render"
    ];
  };
}
