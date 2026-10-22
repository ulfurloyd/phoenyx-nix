{ ... }: {
  flake.homeModules.yazi = { ... }: {
    programs.yazi = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
