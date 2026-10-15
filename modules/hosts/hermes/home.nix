{ self, inputs, ... }: {
  flake.homeConfigurations.wolf = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };

    modules = [
      self.homeModules.wolf
      {
        home.username = "wolf";
        home.homeDirectory = "/home/wolf";
      }
    ];
  };

  flake.homeModules.wolf = { pkgs, ... }: {
    imports = [
      self.homeModules.bash
      self.homeModules.umbriel
      self.homeModules.noctalia
      self.homeModules.kitty
      self.homeModules.vesktop
      self.homeModules.nvim
      self.homeModules.lazygit
      self.homeModules.zellij
      self.homeModules.shell-aliases
    ];

    home.packages = with pkgs; [
      inputs.helium.packages.${system}.default
      ripgrep
      wl-clipboard
      gpu-screen-recorder
    ];

    programs.bash.enable = true;
    programs.git.enable = true;

    home.stateVersion = "26.05";
  };
}
