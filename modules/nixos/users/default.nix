{ pkgs,... }:

{
  programs.bash.enable = true;
  users.users."hex"= {
    isNormalUser = true;
    shell = pkgs.bash;
    description = "hex";
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "video"
      "render"
    ];
    packages = with pkgs;[
      kdePackages.kate
    ];
  };
}
