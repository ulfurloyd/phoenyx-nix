{ inputs, ... }: {
  flake.nixosModules.flyline = {
    imports = [
      inputs.flyline.nixosModules.default
    ];

    programs.flyline.enable = true;
  };
}
