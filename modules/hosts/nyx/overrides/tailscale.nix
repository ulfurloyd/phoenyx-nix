{ ... }: {
  flake.nixosModules.nyxTailscale = {
    services.tailscale = {
      useRoutingFeatures = "server";
    };
  };
}
