{ ... }: {
  flake.nixosModules.nh = { ... }: {
    programs.nh = {
      enable = true;
      flake = "/home/wolf/Projects/phoenyxos";
    };
  };
}
