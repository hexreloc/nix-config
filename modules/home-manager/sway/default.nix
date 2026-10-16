{ config, pkgs, ... }:

let
  mod = "Mod4";
in
  {
  home.packages = with pkgs; [
    fuzzel 
    swaybg 
    swayidle 
    swaylock 
  ];
  wayland.windowManager.sway = {
    enable = true;

    config = {
      modifier = mod;

      fonts = {
        names = [ "Iosevka" ];
        size = 10.0;
      };

      # colors = {
      #   focused = {
      #     border = "#333333";
      #     background = "#1a1a1a";
      #     text = "#e0e0e0";
      #     indicator = "#555555";
      #     childBorder = "#1a1a1a";
      #   };
      #
      #   focusedInactive = {
      #     border = "#222222";
      #     background = "#121212";
      #     text = "#a0a0a0";
      #     indicator = "#333333";
      #     childBorder = "#121212";
      #   };
      #
      #   unfocused = {
      #     border = "#1a1a1a";
      #     background = "#0a0a0a";
      #     text = "#666666";
      #     indicator = "#222222";
      #     childBorder = "#0a0a0a";
      #   };
      #
      #   urgent = {
      #     border = "#cc4444";
      #     background = "#1a1a1a";
      #     text = "#ffffff";
      #     indicator = "#cc4444";
      #     childBorder = "#1a1a1a";
      #   };
      #
      #   placeholder = {
      #     border = "#000000";
      #     background = "#0a0a0a";
      #     text = "#ffffff";
      #     indicator = "#000000";
      #     childBorder = "#0a0a0a";
      #   };
      #
      #   background = "#0a0a0a";
      # };

      output = {
        "eDP-1" = {
          mode = "1920x1080@144Hz";
        };
      };

      input = {
        "*" = {
          repeat_delay = "200";
          repeat_rate = "50";
        };
        "type:touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
          dwt = "enabled";
        };
      };

      startup = [
        {
          command = "swaybg -i ~/nix-config/wallpapers/wall.jpg -m fill";
        }
        {
          command = "nm-applet --indicator";
        }
      ];

      floating = {
        modifier = mod;
        border = 0;
      };

      window = {
        border = 0;
        titlebar = false;
      };

      gaps = {
        inner = 5;
        outer = 2;
      };

      keybindings = {
        "XF86AudioRaiseVolume" =
          "exec pamixer -i 5 && pkill -SIGUSR1 i3status-rs";

        "XF86AudioLowerVolume" =
          "exec pamixer -d 5 && pkill -SIGUSR1 i3status-rs";

        "XF86AudioMute" =
          "exec pamixer -t && pkill -SIGUSR1 i3status-rs";

        "XF86AudioMicMute" =
          "exec pamixer --default-source -t && pkill -SIGUSR1 i3status-rs";

        "XF86MonBrightnessUp" =
          "exec brightnessctl set 5%+";

        "XF86MonBrightnessDown" =
          "exec brightnessctl set 5%-";

        "${mod}+Return" =
          "exec alacritty";

        "${mod}+Shift+q" =
          "kill";

        "${mod}+d" =
          "exec fuzzel";

        "${mod}+b" =
          "exec swaymsg bar mode toggle";

        "${mod}+Control+s" =
          "exec systemctl suspend";
          "${mod}+j" = "focus next";
          "${mod}+k" = "focus prev";
          # "${mod}+l" = "focus  right";
          # "${mod}+h" = "focus right";

        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        "${mod}+Shift+j" = "move left";
        "${mod}+Shift+k" = "move down";
        "${mod}+Shift+l" = "move up";
        "${mod}+Shift+semicolon" = "move right";

        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        "${mod}+h" = "splith";
        "${mod}+v" = "splitv";
        "${mod}+f" = "fullscreen toggle";
        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";
        "${mod}+a" = "focus parent";

        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        "${mod}+Shift+1" =
          "move container to workspace number 1";
        "${mod}+Shift+2" =
          "move container to workspace number 2";
        "${mod}+Shift+3" =
          "move container to workspace number 3";
        "${mod}+Shift+4" =
          "move container to workspace number 4";
        "${mod}+Shift+5" =
          "move container to workspace number 5";
        "${mod}+Shift+6" =
          "move container to workspace number 6";
        "${mod}+Shift+7" =
          "move container to workspace number 7";
        "${mod}+Shift+8" =
          "move container to workspace number 8";
        "${mod}+Shift+9" =
          "move container to workspace number 9";
        "${mod}+Shift+0" =
          "move container to workspace number 10";

        "${mod}+Shift+c" =
          "reload";

        "${mod}+Shift+r" =
          "restart";

        "${mod}+Shift+e" =
          "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit Sway?' -B 'Yes, exit Sway' 'swaymsg exit'";

        "${mod}+r" =
          "mode resize";
      };

      modes = {
        resize = {
          "j" = "resize shrink width 10 px";
          "k" = "resize grow height 10 px";
          "l" = "resize shrink height 10 px";
          "semicolon" = "resize grow width 10 px";

          "Left" = "resize shrink width 10 px";
          "Down" = "resize grow height 10 px";
          "Up" = "resize shrink height 10 px";
          "Right" = "resize grow width 10 px";

          "Return" = "mode default";
          "Escape" = "mode default";
          "${mod}+r" = "mode default";
        };
      };

      bars = [
        {
          mode = "invisible";
          hiddenState = "hide";
          position = "top";

          fonts = {
            names = [ "Iosevka" ];
            size = 12.0;
          };

          statusCommand =
            "i3status-rs ~/.config/i3status-rust/config-default.toml";

          colors = {
            background = "#0a0a0a";
            statusline = "#c0c0c0";
            separator = "#2a2a2a";

            focusedWorkspace = {
              border = "#333333";
              background = "#1a1a1a";
              text = "#e0e0e0";
            };

            activeWorkspace = {
              border = "#222222";
              background = "#121212";
              text = "#a0a0a0";
            };

            inactiveWorkspace = {
              border = "#1a1a1a";
              background = "#0a0a0a";
              text = "#666666";
            };

            urgentWorkspace = {
              border = "#cc4444";
              background = "#1a1a1a";
              text = "#ffffff";
            };

            bindingMode = {
              border = "#cc4444";
              background = "#1a1a1a";
              text = "#ffffff";
            };
          };
        }
      ];
    };

    extraConfig = ''
      tiling_drag enable
    '';
  };
}
