{ ... }: {
  flake.nixosModules.k3s = { ... }: {
    services.k3s = {
      enable = true;
      role = "server";
      nodeIP = "192.168.0.5";
      extraFlags = toString [
        "--tls-san=192.168.0.5"
      ];
    };

    networking.firewall = {
      allowedTCPPorts = [
        6443 # kubernetes API
        80 # HTTP ingress
        443 # HTTPS ingress
        53 # pihole DNS
      ];

      allowedUDPPorts = [
        53 # pihole DNS
      ];
    };
  };
}
