{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "HexReloc";
        email = "hexreloc@gmail.com";
      };

      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };

  programs.ssh = {
    enable = true;

    matchBlocks."github.com" = {
      hostname = "github.com";
      user = "git";
      identityFile = "~/.ssh/github";
      identitiesOnly = true;
    };
  };
}

