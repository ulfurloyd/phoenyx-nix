{ ... }: {
  flake.homeModules.languages = { ... }: {
    programs.go = {
      enable = true;
    };
  };
}
