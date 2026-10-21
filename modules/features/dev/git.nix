{ ... }: {
  flake.homeModules.git = { ... }: {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "ulfurloyd";
          email = "wolfinthedepths@proton.me";
        };
      };
    };
  };
}
