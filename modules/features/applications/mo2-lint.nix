{ inputs, ... }: {
  flake.homeModules.mo2-lint = {
    imports = [
      inputs.mo2-lint.homeModules.default
    ];

    programs.mo2-lint = {
      enable = true;

      settings.instance = {
        launcher = "steam";
        theme = "paper-dark";
        plugins = [
          "root-builder"
          "auto-activator"
        ];
      };
    };
  };
}
