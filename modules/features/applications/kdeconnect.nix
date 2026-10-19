{ ... }: {
  flake.nixosModules.kdeconnect = {
    programs.kdeconnect.enable = true;
  };

  flake.homeModules.kdeconnect = {
    services.kdeconnect = {
      enable = true;
      indicator = true;
    };
  };
}
