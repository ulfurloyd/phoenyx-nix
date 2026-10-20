{ ... }: {
  flake.homeModules.k9s = { ... }: {
    programs.k9s.enable = true;
  };
}
