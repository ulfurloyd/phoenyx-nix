{ ... }: {
  flake.nixosModules.steam = { pkgs, ... }: {
    programs.steam = {
      enable = true;
      package = pkgs.millennium-steam;
    };
  };
}
