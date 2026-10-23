{ self, inputs, ... }: {

  flake.nixosConfigurations.nyx = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      nyxConfiguration
      myHomeManager
      umbriel
      noctalia
      keyd
      flyline
      fonts
      kdeconnect
      nh
    ];
  };
}
