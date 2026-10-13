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
      self.homeModules.umbriel
      self.homeModules.noctalia
    ];

    home.packages = with pkgs; [
      inputs.helium.packages.${system}.default
    ];

    programs.bash.enable = true;
    programs.git.enable = true;

    home.stateVersion = "26.05";
  };
}
