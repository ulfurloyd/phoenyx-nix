{ self, inputs, ... }: {

  flake.nixosConfigurations.hermes = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.hermesConfiguration
      self.nixosModules.myHomeManager
    ];
  };
}
