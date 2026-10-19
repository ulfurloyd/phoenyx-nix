{ inputs, ... }: {
  flake.nixosModules.overlays = { ... }: {
    nixpkgs.overlays = [
      inputs.helium.overlays.default
    ];
  };
}
