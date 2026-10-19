{ self, inputs, ... }: {

  flake.nixosConfigurations.hermes = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.nyxConfiguration
      self.nixosModules.myHomeManager
      self.nixosModules.umbriel
      self.nixosModules.noctalia
      self.nixosModules.keyd
      self.nixosModules.flyline
      self.nixosModules.fonts
      self.nixosModules.kdeconnect
    ];
  };
}
