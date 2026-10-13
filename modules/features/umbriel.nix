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
        general.autostart = [ "noctalia" ];
	layout.gap = 2;
	keybinds = {
	  "Mod+Return" = "spawn:konsole";
	};
      };
    };
  };
}
