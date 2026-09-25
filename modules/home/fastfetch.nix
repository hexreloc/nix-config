{
  programs.fastfetch = {
    enable = true;

    settings = {
      display = {
        separator = " ";
        color = {
          keys = "cyan";
          title = "blue";
        };
      };

      modules = [
        {
          type = "title";
          format = "{user-name-colored}@{host-name-colored}";
        }

        {
          type = "custom";
          key = "╭──────────────╮";
          format = "";
        }

        {
          type = "os";
          key = "│   OS        │";
        }

        {
          type = "kernel";
          key = "│   Kernel    │";
        }

        {
          type = "uptime";
          key = "│ 󰅐  Uptime    │";
        }

        {
          type = "packages";
          key = "│ 󰏓  Packages  │";
        }

        {
          type = "shell";
          key = "│   Shell     │";
        }

        {
          type = "custom";
          key = "├──────────────┤";
          format = "";
        }

        {
          type = "wm";
          key = "│   WM        │";
        }

        {
          type = "terminal";
          key = "│   Terminal  │";
        }
        {
          type = "custom";
          key = "├──────────────┤";
          format = "";
        }

        {
          type = "cpu";
          key = "│ 󰍛  CPU       │";
          showPeCoreCount = true;
        }

        {
          type = "gpu";
          key = "│ 󰢮  GPU       │";
        }

        {
          type = "memory";
          key = "│ 󰍛  Memory    │";
        }

        {
          type = "swap";
          key = "│ 󰍛  Swap      │";
        }

        {
          type = "disk";
          key = "│ 󰋊  Disk      │";
          folders = [ "/" ];
        }

        {
          type = "battery";
          key = "│ 󰁹  Battery   │";
        }

        {
          type = "custom";
          key = "╰──────────────╯";
          format = "";
        }

        {
          type = "colors";
          paddingLeft = 1;
          symbol = "circle";
        }
      ];
    };
  };
}

