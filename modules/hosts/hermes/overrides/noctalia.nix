{ ... }: {
  flake.homeModules.hermesNoctalia = {
    programs.noctalia.settings = {
      bar.primary = {
        end = [
          "clock"
          "date"
          "tray"
          "nix-status"
          "network"
          "bluetooth"
          "recorder"
          "phone-connect"
          "weather"
          "volume"
          "brightness"
          "battery"
        ];
      };
      plugin_settings."mindnbytes/nix-status".nixos_configuration = "hermes";
    };
  };
}
