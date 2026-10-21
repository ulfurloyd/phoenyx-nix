{ ... }: {
  flake.homeModules.devenv = { ... }: {
    programs.devenv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
  };
}
