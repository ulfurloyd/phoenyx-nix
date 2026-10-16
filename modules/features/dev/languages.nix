{ ... }: {
  flake.homeModules.languages = { ... }: {
    programs = {
      go.enable = true;
      gcc.enable = true;
    };
  };
}
