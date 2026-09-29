{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      targets = [ "graphical-session.target" ];
    };
    style = ''
      * {
        font-family: "Iosevka", "JetBrainsMono Nerd Font", "Hack Nerd Font", monospace;
        font-size: 13px;
        font-weight: 700;
        border: none;
        border-radius: 0;
        min-height: 0;
      }

      window#waybar {
        background-color: #11111b;
        color: #cdd6f4;
      }

      #workspaces,
      #custom-launcher,
      #clock,
      #pulseaudio,
      #backlight,
      #memory,
      #cpu,
      #network,
      #battery,
      #tray,
      #mpd {
        background-color: #181825;
        padding: 2px 10px;
        margin: 4px 3px 4px 3px;
        border-radius: 12px;
        border: 1px solid #313244;
      }

      #workspaces {
        padding: 2px 4px;
      }

      #workspaces button {
        padding: 1px 6px;
        margin: 1px;
        color: #a6adc8;
        background-color: transparent;
        border: none;
        border-radius: 10px;
      }

      #workspaces button.active,
      #workspaces button.focused {
        background: linear-gradient(45deg, #cba6f7, #89b4fa);
        color: #11111b;
        min-width: 24px;
      }

      #workspaces button.urgent {
        background-color: #f38ba8;
        color: #11111b;
      }

      #workspaces button:hover {
        background-color: #313244;
        color: #cdd6f4;
      }

      tooltip {
        background: #1e1e2e;
        border: 1px solid #89b4fa;
        border-radius: 8px;
      }

      tooltip label {
        color: #cdd6f4;
      }

      #custom-launcher {
        font-size: 15px;
        color: #89b4fa;
        padding: 2px 12px;
      }

      #custom-launcher:hover {
        color: #cba6f7;
        background-color: #313244;
      }

      #memory { color: #a6e3a1; }
      #cpu { color: #f9e2af; }
      #clock { color: #89b4fa; }
      #backlight { color: #f9e2af; }
      #pulseaudio { color: #89b4fa; }

      #network { color: #a6e3a1; }
      #network.disconnected { color: #f38ba8; }

      #battery { color: #a6e3a1; }
      #battery.charging { color: #f9e2af; }
      #battery.warning:not(.charging) { color: #fab387; }
      #battery.critical:not(.charging) {
        color: #f38ba8;
        animation: blink 1.5s linear infinite;
      }

      #mpd { color: #cba6f7; }
      #mpd.paused { color: #6c7086; font-style: italic; }
      #mpd.stopped {
        background: transparent;
        border: none;
      }

      #tray {
        padding: 2px 8px;
      }

      @keyframes blink {
        to {
          background-color: #f38ba8;
          color: #11111b;
        }
      }
    '';
    settings = [{
      layer = "top";
      position = "top";
      margin = "0";
      spacing = 0;
      modules-left = [
        "custom/launcher"
        "hyprland/workspaces"
        "mpd"
      ];
      modules-center = [ "clock" ];
      modules-right = [
        "pulseaudio"
        "backlight"
        "memory"
        "cpu"
        "network"
        "battery"
        "tray"
      ];
      "hyprland/workspaces" = {
        format = "{icon}";
        format-icons = {
          "1" = "1";
          "2" = "2";
          "3" = "3";
          "4" = "4";
          "5" = "5";
        };
        on-click = "activate";
        sort-by-number = true;
      };
      "custom/launcher" = {
        format = " ";
        on-click = "fuzzel";
        tooltip = false;
      };
      "pulseaudio" = {
        scroll-step = 1;
        format = "{icon} {volume}%";
        format-muted = "󰖁 Muted";
        format-icons = {
          default = [ "" "" "" ];
        };
        on-click = "pamixer -t";
        tooltip = false;
      };
      "clock" = {
        interval = 60;
        format = "  {:%I:%M %p    %b %d}";
        tooltip = true;
        tooltip-format = "<tt><small>{calendar}</small></tt>";
        calendar = {
          mode = "month";
          mode-mon-col = 3;
          weeks-pos = "right";
          on-scroll = 1;
          format = {
            months = "<span color='#cdd6f4'><b>{}</b></span>";
            days = "<span color='#a6adc8'>{}</span>";
            weeks = "<span color='#f5c2e7'><b>W{}</b></span>";
            weekdays = "<span color='#f9e2af'><b>{}</b></span>";
            today = "<span color='#f38ba8'><b>{}</b></span>";
          };
        };
      };
      "memory" = {
        interval = 30;
        format = "󰻠 {percentage}%";
      };
      "cpu" = {
        interval = 15;
        format = "󰍛 {usage}%";
      };
      "mpd" = {
        max-length = 40;
        format = "  {title} - {artist}";
        format-paused = "  {title} - {artist}";
        format-stopped = "";
        format-disconnected = "";
        on-click = "mpc --quiet toggle";
        tooltip-format = "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
      };
      "network" = {
        format-disconnected = "󰯡";
        format-ethernet = "󰒢";
        format-linked = "󰖪";
        format-wifi = "󰖩";          # icon only, no SSID
        interval = 10;
        tooltip = true;               # tooltip still shows details on hover
      };
      "battery" = {
        interval = 10;
        format = "{icon} {capacity}%";
        format-charging = "󰂄 {capacity}%";
        format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        states = {
          warning = 30;
          critical = 15;
        };
        tooltip = true;
      };
      "tray" = {
        icon-size = 16;
        spacing = 6;
      };
      "backlight" = {
        format = "{icon} {percent}%";
        format-icons = [ "" "" "" "" "" "" "" "" "" ];
      };
    }];
  };
}
