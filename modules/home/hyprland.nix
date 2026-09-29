{ pkgs, ... }:
{
    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        systemd.enable = true;
        configType = "lua";
        extraConfig = ''
            hl.monitor({
              output = "",
              mode = "preferred",
              position = "auto",
              scale = 1,
            })

            hl.on("hyprland.start", function()
                hl.exec_cmd("waybar")
                hl.exec_cmd("hyprpaper")
                hl.exec_cmd("wl-paste --type text --watch cliphist store")
            end)

            hl.config({
                general = {
                    gaps_in = 2,
                    gaps_out = 2,
                    border_size = 1,
                    col = {
                        active_border = "rgb(cba6f7)",
                        inactive_border = "rgb(313244)",
                    },
                    layout = "dwindle",
                },
                input = {
                    kb_layout = "us",
                    follow_mouse = 1,
                    repeat_delay = 200,
                    repeat_rate = 50,
                    touchpad = {
                        natural_scroll = true,
                    },
                },
                decoration = {
                    rounding = 2,
                },
                animations = {
                    enabled =false,
                },
            })

            hl.curve("easeOut", {
                type = "bezier",
                points = {
                    { 0.16, 1 },
                    { 0.30, 1 },
                },
            })

            hl.animation({
                leaf = "windows",
                enabled = true,
                speed = 3,
                bezier = "easeOut",
            })
            hl.animation({
                leaf = "fade",
                enabled = true,
                speed = 3,
                bezier = "easeOut",
            })
            hl.animation({
                leaf = "workspaces",
                enabled = true,
                speed = 3,
                bezier = "easeOut",
            })

            hl.env("NIXOS_OZONE_WL", "1")
            hl.env("QT_QPA_PLATFORM", "wayland")
            hl.env("SDL_VIDEODRIVER", "wayland")
            hl.env("GDK_BACKEND", "wayland,x11,*")
            hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
            hl.env("XDG_SESSION_DESKTOP", "Hyprland")
            hl.env("XDG_SESSION_TYPE", "wayland")

            hl.on("hyprland.start", function()
                hl.exec_cmd(
                    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
                )
                hl.exec_cmd(
                    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
                )
            end)

            local mod = "SUPER"

            -- Apps
            hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd("alacritty"))
            hl.bind(mod .. " + D", hl.dsp.exec_cmd("fuzzel"))

            -- Window management
            hl.bind(mod .. " + SHIFT + Q", hl.dsp.window.close())
            hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
            hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
            hl.bind(mod .. " + SHIFT + E", hl.dsp.exit())

            -- Focus
            hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
            hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))
            hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
            hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))
            hl.bind(mod .. " + LEFT", hl.dsp.focus({ direction = "left" }))
            hl.bind(mod .. " + RIGHT", hl.dsp.focus({ direction = "right" }))
            hl.bind(mod .. " + UP", hl.dsp.focus({ direction = "up" }))
            hl.bind(mod .. " + DOWN", hl.dsp.focus({ direction = "down" }))

            -- Move windows
            hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
            hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
            hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
            hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

            -- Workspaces (1-10)
            for i = 1, 10 do
                local key = i % 10  -- 10 → key "0"
                hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
                hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
            end

            -- Waybar toggle
            hl.bind(mod .. " + B", hl.dsp.exec_cmd("pkill -USR1 waybar"))

            -- Brightness / Volume
            hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"))
            hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))
            hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"))
            hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"))
            hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t"))
            hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pamixer --default-source -t"))

            -- Mouse
            hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
            hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

            -- Window rules
            hl.window_rule({
                name = "float-pavucontrol",
                match = {
                    class = "^pavucontrol$",
                },
                float = true,
            })
        '';
    };

    # Wallpaper via hyprpaper
    services.hyprpaper = {
        enable = true;
        settings = {
            wallpaper = [
                {
                    monitor = "";  # all monitors / fallback
                    path = "/home/hex/nix-config/wallpapers/wallpaper.png";
                    fit_mode = "cover";
                }
            ];
        };
    };
}
