{ self, inputs, ... }: {
  flake.homeConfigurations.wolf = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };

    modules = [
      self.homeModules.wolf {
       home.username = "wolf";
       home.homeDirectory = "/home/wolf";
      }
    ];
  };

  flake.homeModules.wolf = { pkgs, ... }: {
    imports = [
      inputs.umbriel.homeModules.default
    ];

    programs.bash.enable = true;
    programs.git.enable = true;
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

    home.stateVersion = "26.05";
  };
}
