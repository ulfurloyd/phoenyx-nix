{ inputs, ... }: {
  flake.nixosModules.noctalia = {
    imports = [
      inputs.noctalia.nixosModules.default
    ];

    programs.noctalia = {
      enable = true;
      recommendedServices.enable = true;
    };
  };

  flake.homeModules.noctalia = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;

      settings = {
        audio.enable_sounds = true;
        control_center = {
          hidden_tabs = [
            "monitor"
            "screen-time"
          ];
          width = 900;
        };
        dock.enabled = false;
        keybinds = {
          cancel = [
            "Escape"
          ];
          down = [
            "Ctrl+n"
            "Ctrl+j"
          ];
          left = [
            "Ctrl+h"
          ];
          right = [
            "Ctrl+l"
          ];
          up = [
            "Ctrl+p"
            "Ctrl+k"
          ];
          validate = [
            "Return"
          ];
        };
        location.auto_locate = true;
        notification = {
          background_opacity = 0.4;
          layer = "overlay";
        };
        osd = {
          background_opacity = 0.4;
          position = "bottom_center";
        };
        theme = {
          mode = "dark";
          source = "wallpaper";
          wallpaper_scheme = "m3-content";

          templates = {
            builtin_ids = [
              "btop"
              "gtk3"
              "gtk4"
              "kcolorscheme"
              "qt"
              "umbriel"
            ];
            community_ids = [
              "pywalfox"
              "zen-browser"
              "discord"
              "gimp"
              "neovim"
              "fastfetch"
              "zathura"
              "zellij"
              "bat"
              "lazygit"
              "yazi"
            ];
          };
        };
        bar = {
          primary = {
            background_opacity = 0.5;
            end = [
              "tray"
              "network"
              "bluetooth"
              "weather"
              "volume"
              "brightness"
              "battery"
            ];
            margin_ends = 10;
            position = "top";
            radius = 15;
            scale = 1.0;
            start = [
              "notifications"
              "workspaces"
              "active_window"
            ];
          };
        };
        shell = {
          umbriel_overview_type_to_launch_enabled = true;
          greeter_sync.auto_sync = true;
          polkit_agent = true;
          settings_window_translucent = true;
          telemetry_enabled = false;
          ui_scale = 1.1;
          screenshot = {
            directory = "/home/wolf/Pictures/Screenshots";
            filename_pattern = "%Y_%m-%d_%H:%M:%S";
            confirm_region = true;
          };
          panel = {
            attach_session = true;
            attach_launcher = true;
            clipboard_placement = "attached";
            transparency_mode = "glass";
          };
          session.actions = [
            {
              action = "lock";
              countdown_seconds = 0.0;
              enabled = true;
              shortcut = "l";
              variant = "default";
            }
            {
              action = "logout";
              countdown_seconds = 5.0;
              enabled = true;
              shortcut = "o";
              variant = "default";
            }
            {
              action = "lock_and_suspend";
              countdown_seconds = 5.0;
              enabled = true;
              shortcut = "u";
              variant = "default";
            }
            {
              action = "reboot";
              countdown_seconds = 5.0;
              enabled = true;
              shortcut = "r";
              variant = "default";
            }
            {
              action = "shutdown";
              countdown_seconds = 5.0;
              enabled = true;
              shortcut = "s";
              variant = "destructive";
            }
          ];
        };
        widget = {
          clock.format = "{:%H:%M:%S}";
          notifications.capsule = false;
          workspaces.show_labels = false;
          weather.show_condition = false;
        };
        plugins = {
          enabled = [
            "noctalia/translator"
            "noctalia/screen_recorder"
            "noctalia/wallhaven"
            "noctalia/kaomoji"
            "noctalia/mpvpaper"
            "noctalia/bitwarden"
            "gustav0ar/drive-health"
            "tmelik/system-monitor"
            "noctalia/umbriel-companion"
          ];
          settings = {
            "noctalia/bitwarden".server_url = "https://vaultwarden.phoenyxlab.xyz";
          };
        };
      };
    };
  };
}
