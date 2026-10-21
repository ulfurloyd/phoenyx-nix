{ ... }: {
  flake.nixosModules.openssh = { ... }: {
    services.openssh = {
      enable = true;
      openFirewall = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };

  flake.homeModules.ssh = { ... }: {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;

      settings = {
        nyx = {
          HostName = "192.168.0.5";
          User = "wolf";
        };

        hermes = {
          HostName = "192.168.0.14";
          User = "wolf";
        };

        vnic = {
          HostName = "100.72.76.103";
          User = "ubuntu";
        };

        "*" = {
          ForwardAgent = false;
          AddKeysToAgent = "no";
          Compression = false;
          ServerAliveInterval = 0;
          ServerAliveCountMax = 3;
          HashKnownHosts = false;
          UserKnownHostsFile = "~/.ssh/known_hosts";
          ControlMaster = "no";
          ControlPath = "~/.ssh/master-%r@%n:%p";
          ControlPersist = "no";
        };
      };
    };
  };
}
