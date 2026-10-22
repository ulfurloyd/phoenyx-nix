{ ... }: {
  flake.homeModules.git = { ... }: {
    programs.git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        user = {
          name = "ulfurloyd";
          email = "wolfinthedepths@proton.me";
        };
      };
    };
  };
}
