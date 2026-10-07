{ pkgs, ... }:

{
  home.packages = [
    pkgs.tofi
  ];

  home.file.".config/tofi/configA".source =
    ../../config/tofi/configA;

  home.file.".config/tofi/configV".source =
    ../../config/tofi/configV;
}
