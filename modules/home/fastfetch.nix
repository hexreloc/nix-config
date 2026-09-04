{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = "auto";
        padding = {
          top = 3;
          right = 2;
          left = 2;
        };
      };

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
          type = "command";
          key = "│   Age       │";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
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
          type = "terminalfont";
          key = "│ 󰛖  Font      │";
        }

        {
          type = "theme";
          key = "│ 󰉼  Theme     │";
        }

        {
          type = "icons";
          key = "│ 󰀻  Icons     │";
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
          key = "├──────────────┤";
          format = "";
        }

        {
          type = "localip";
          key = "│ 󰩟  Local IP  │";
          showIpv4 = true;
        }

        {
          type = "locale";
          key = "│ 󰗊  Locale    │";
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

