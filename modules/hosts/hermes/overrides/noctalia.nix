{ lib, ... }: {
  flake.homeModules.hermesNoctalia = {
    programs.noctalia.settings = {
      bar.primary = {
        end = lib.mkForce [
          "clock"
          "tray"
          "nix-status"
          "network"
          "bluetooth"
          "recorder"
          "phone-connect"
          "weather"
          "volume"
          "battery"
        ];
      };
      plugin_settings."mindnbytes/nix-status".nixos_configuration = lib.mkForce "hermes";
    };
  };
}
