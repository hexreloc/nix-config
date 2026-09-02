{ ... }:

{
  users.users."hex"= {
    isNormalUser = true;
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
