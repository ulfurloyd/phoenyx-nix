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
	widget = {
	  clock.format = "{:%H:%M:%S}";
	  notifications.capsule = false;
	  workspaces.show_labels = false;
	  weather.show_condition = false;
	};
      };
    };
  };
}
