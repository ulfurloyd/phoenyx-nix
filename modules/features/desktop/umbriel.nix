{ inputs, ... }: {
  flake.nixosModules.umbriel = {
    imports = [
      inputs.umbriel.nixosModules.default
    ];

    programs.umbriel.enable = true;
  };

  flake.homeModules.umbriel = {
    imports = [
      inputs.umbriel.homeModules.default
    ];

    programs.umbriel = {
      enable = true;
      settings = {
        general = {
          autostart = [
            "noctalia"
            "xwayland-satellite"
          ];
          mod_key = "Super";
          xwayland = true;
          show_cheatsheet = false;
          focus_on_activate = false;
          honor_restored_maximize = false;
        };

        layout = {
          mode = "scrolling";
          gap = 10;
          extent_presets = [
            0.333
            0.5
            0.667
          ];
          scrolling = {
            default_extent_fraction = 0.5;
            center_underfull_strip = true;
          };
        };

        keybinds = {
          "Mod+Return" = "spawn:kitty";
          "Mod+T" = "window-toggle-floating";
          "Mod+R" = "window-cycle-primary-extent";
          "Mod+F" = "window-toggle-maximize";
          "Mod+M" = "window-toggle-fullscreen";
          "Mod+W" = "window-close";
          "Mod+Shift+S" = "window-move-to-scratchpad";
          "Mod+Shift+Slash" = "cheatsheet-toggle";
          "Mod+S" = "scratchpad-toggle";
          "Mod+Ctrl+S" = "window-restore-from-scratchpad";
          "Mod+Tab" = "scratchpad-focus-next";
          "Mod+Space" = "spawn:noctalia msg panel-toggle launcher";
          "Mod+O" = "overview-toggle";

          "Mod+1" = "workspace-switch:1";
          "Mod+2" = "workspace-switch:2";
          "Mod+3" = "workspace-switch:3";
          "Mod+4" = "workspace-switch:4";
          "Mod+5" = "workspace-switch:5";
          "Mod+6" = "workspace-switch:6";
          "Mod+7" = "workspace-switch:7";
          "Mod+8" = "workspace-switch:8";
          "Mod+9" = "workspace-switch:9";
          "Mod+U" = "workspace-next";
          "Mod+I" = "workspace-previous";
          "Mod+Shift+1" = "window-move-to-workspace:1";
          "Mod+Shift+2" = "window-move-to-workspace:2";
          "Mod+Shift+3" = "window-move-to-workspace:3";
          "Mod+Shift+4" = "window-move-to-workspace:4";
          "Mod+Shift+5" = "window-move-to-workspace:5";
          "Mod+Shift+6" = "window-move-to-workspace:6";
          "Mod+Shift+7" = "window-move-to-workspace:7";
          "Mod+Shift+8" = "window-move-to-workspace:8";
          "Mod+Shift+9" = "window-move-to-workspace:9";
          "Mod+Shift+U" = "window-move-to-workspace-next";
          "Mod+Shift+I" = "window-move-to-workspace-previous";
          "Mod+Shift+H" = "column-move-left";
          "Mod+Shift+L" = "column-move-right";
          "Mod+Ctrl+Shift+H" = "window-move-output-left";
          "Mod+Ctrl+Shift+L" = "window-move-output-right";
          "Mod+H" = "window-focus-left";
          "Mod+J" = "window-focus-down";
          "Mod+K" = "window-focus-up";
          "Mod+L" = "window-focus-right";
          "Mod+WheelUp" = "window-focus-left";
          "Mod+WheelDown" = "window-focus-right";
          "Mod+Ctrl+H" = "output-focus-left";
          "Mod+Ctrl+L" = "output-focus-right";
          "Mod+C" = "window-center";
          "Mod+Shift+T" = "workspace-set-layout:toggle";
          "Mod+Ctrl+I" = "workspace-move-up";
          "Mod+Ctrl+U" = "workspace-move-down";

          # media controls
          "XF86AudioLowerVolume" = "spawn:wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
          "XF86AudioRaiseVolume" = "spawn:wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+ -l 1.0";
          "XF86AudioMute" = "spawn:wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "XF86AudioMicMute" = "spawn:wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

          "XF86AudioPlay" = "spawn:playerctl -p %any play-pause";
          "XF86AudioStop" = "spawn:playerctl -p %any stop";
          "XF86AudioPrev" = "spawn:playerctl -p %any previous";
          "XF86AudioNext" = "spawn:playerctl -p %any next";

          # screen brightness
          "XF86MonBrightnessUp" = "spawn:noctalia msg brightness-up";
          "XF86MonBrightnessDown" = "spawn:noctalia msg brightness-down";

          # noctalia
          "Mod+Alt+S" = "spawn:noctalia msg settings-toggle";
          "Mod+D" = "spawn:noctalia msg panel-toggle control-center";
          "Mod+N" = "spawn:noctalia msg panel-toggle control-center notifications";
          "Mod+A" = "spawn:noctalia msg panel-toggle noctalia/umbriel-companion:panel";
          "Mod+Ctrl+W" = "spawn:noctalia msg panel-toggle wallpaper";
          "Mod+Ctrl+N" = "spawn:noctalia msg notification-dnd-toggle";
          "Mod+Ctrl+C" = "spawn:noctalia msg panel-toggle clipboard";
          "Mod+Ctrl+Shift+W" = "spawn:noctalia msg panel-toggle noctalia/wallhaven:browser";
          "Mod+Ctrl+M" = "spawn:noctalia msg panel-toggle control-center media";
          "Mod+P" = "spawn:noctalia msg panel-toggle session";
          "Mod+F12" = "spawn:noctalia msg screenshot-region";
          "Mod+Shift+F12" = "spawn:noctalia msg screenshot-fullscreen";
          "Mod+Ctrl+F12" = "spawn:noctalia msg plugin noctalia/screen_recorder:service all toggle";
        };

        appearance = {
          prefer_no_csd = true;
          border_width = 1;
          outer_border_width = 0;
          corner_radius = 5;
          blur = {
            enabled = true;
            optimized = true;
            passes = 3;
            radius = 3;
            noise = 0.02;
            brightness = 0.9;
            contrast = 0.9;
            saturation = 1.1;
          };
          shadow = {
            enabled = true;
            softness = 10;
            offset_x = 2;
            offset_y = 2;
          };
        };

        environment.QT_QPA_PLATFORMTHEME = "qt6ct";

        input = {
          keyboard.repeat_rate = 25;
          keyboard.repeat_delay = 600;

          touchpad.tap = true;
          touchpad.natural_scroll = true;

          mouse = {
            natural_scroll = false;
            accel_profile = "flat";
            sensitivity = 0.0;
            scroll_wheel_step = 60;
          };

          cursor = {
            size = 24;
            follows_focus = true;
            hardware_cursor = true;
            hide_when_typing = false;
            hide_timeout_ms = 0;
          };

          focus.follows_mouse = true;
          focus.follows_mouse_max_scroll = 0.5;
        };

        overview.zoom = 0.5;

        hot_corners.top_left = {
          enabled = true;
          delay_ms = 500;
          action = "overview-open";
        };

        window_rule = [
          {
            blur = true;
            blur_optimized = true;
          }
          {
            match.app_id = "^dev.noctalia.Noctalia$";
            default_floating = false;
          }
          {
            match.app_id = "^dev.noctalia.UmbrielSharePicker$";
            default_floating = true;
            default_floating_size_px = {
              width = 800;
              height = 600;
            };
          }
        ];

        layer_rule = [
          {
            match.namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd|desktop-widget-[^\"]*)$";
            blur = true;
            blur_ignore_alpha = 0.4;
            blur_popups = true;
          }
        ];

        workspaces.back_and_forth = true;

        include.optional.files = [ "noctalia.toml" ];
      };
    };
  };
}
