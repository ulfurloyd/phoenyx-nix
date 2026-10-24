{ inputs, ... }: {
  flake.nixosModules.overlays = { ... }: {
    nixpkgs.overlays = [
      inputs.helium.overlays.default
      inputs.millennium.overlays.default
      inputs.mo2-lint.overlays.default
    ];
  };
}
