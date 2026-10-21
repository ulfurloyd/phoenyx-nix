{ ... }: {
  flake.homeModules.hermesNoctalia = {
    programs.noctalia.settings.bar.primary = {
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
  };
}
