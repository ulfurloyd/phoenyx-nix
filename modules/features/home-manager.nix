{ self, inputs, ... }: {
  
  flake.nixosModules.myHomeManager = { pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.default
    ];

    home-manager = {
      useGlobalPkgs = true;
      userUserPackages = true;
    };
  };

}
