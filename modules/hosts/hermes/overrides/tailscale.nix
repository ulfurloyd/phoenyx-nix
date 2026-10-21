{ lib, ... }: {
  flake.nixosModules.hermesTailscale = {
    services.tailscale = {
      useRoutingFeatures = lib.mkForce "client";
      extraSetFlags = [
        "--accept-routes=true"
      ];
    };
  };
}
