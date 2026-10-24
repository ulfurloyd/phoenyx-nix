{ inputs, ... }: {
  flake.nixosModules.openmw = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.openmw
      inputs.openmw-nix.packages.${pkgs.stdenv.hostPlatform.system}.umo
      inputs.openmw-nix.packages.${pkgs.stdenv.hostPlatform.system}.momw-configurator
      inputs.openmw-nix.packages.${pkgs.stdenv.hostPlatform.system}.openmw-validator
      inputs.openmw-nix.packages.${pkgs.stdenv.hostPlatform.system}.plox
      inputs.openmw-nix.packages.${pkgs.stdenv.hostPlatform.system}.delta-plugin
      inputs.openmw-nix.packages.${pkgs.stdenv.hostPlatform.system}.groundcoverify
      inputs.openmw-nix.packages.${pkgs.stdenv.hostPlatform.system}.s3lightfixes
      inputs.openmw-nix.packages.${pkgs.stdenv.hostPlatform.system}.vfstool
    ];
  };
}
