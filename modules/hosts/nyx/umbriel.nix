{ ... }: {
  flake.homeModules.nyxUmbriel = {
    programs.umbriel.settings.output = {
      "DP-1" = {
        mode = "1920x1080@144";
        position = [
          0
          0
        ];
        scale = 1;
      };
      "HDMI-A-1" = {
        mode = "1920x1080@144";
        position = [
          1920
          30
        ];
        scale = 1;
      };
    };
  };
}
