{ ... }: {
  flake.homeModules.lazygit = { ... }: {
    programs.lazygit = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
