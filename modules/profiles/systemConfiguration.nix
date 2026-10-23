{ self, ... }: {
  flake.nixosModules.systemConfiguration = { ... }: {
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
  };
}
