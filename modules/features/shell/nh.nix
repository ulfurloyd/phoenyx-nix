{ ... }: {
  flake.nixosModules.nh = { ... }: {
    programs.nh = {
      enable = true;
      flake = "~/Projects/phoenyxos";
    };
  };
}
