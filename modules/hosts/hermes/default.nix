{ self, inputs, ... }: {

  flake.nixosConfigurations.hermes = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.hermesConfiguration
      self.nixosModules.myHomeManager
      self.nixosModules.umbriel
      self.nixosModules.noctalia
      self.nixosModules.keyd
      self.nixosModules.flyline
    ];
  };
}
