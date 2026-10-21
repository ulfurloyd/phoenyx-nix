{ lib, ... }: {
  flake.homeModules.hermesNoctalia = {
    programs.noctalia.settings = {
      bar.primary = {
        end = lib.mkForce [
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
      plugin_settings."mindnbytes/nix-status".nixos_configuration = lib.mkForce "hermes";
    };
  };
}
