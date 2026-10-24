{ self, ... }: {
  flake.nixosModules.systemConfiguration = { pkgs, ... }: {
    imports = with self.nixosModules; [
      myHomeManager
      umbriel
      noctalia
      keyd
      flyline
      fonts
      kdeconnect
      nh
    ];
    environment.systemPackages = with pkgs; [
      vim
      wget
      xwayland-satellite
    ];
  };
}
