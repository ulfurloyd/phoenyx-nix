{ self, inputs, ... }: {

  flake.nixosConfigurations.nyx = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      nyxConfiguration
      systemConfiguration
      nvidia
      openmw
    ];
  };
}
