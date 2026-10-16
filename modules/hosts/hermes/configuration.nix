{ self, ... }: {
  flake.nixosModules.hermesConfiguration = { pkgs, ... }: {
    imports = [
      self.nixosModules.overlays
      self.nixosModules.hermesHardware
      self.nixosModules.noctalia-greeter
    ];

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    # boot
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # networking
    networking.hostName = "hermes";
    networking.networkmanager.enable = true;

    # locale and timezone
    time.timeZone = "Asia/Kolkata";
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_IN";
      LC_IDENTIFICATION = "en_IN";
      LC_MEASUREMENT = "en_IN";
      LC_MONETARY = "en_IN";
      LC_NAME = "en_IN";
      LC_NUMERIC = "en_IN";
      LC_PAPER = "en_IN";
      LC_TELEPHONE = "en_IN";
      LC_TIME = "en_IN";
    };

    # kde
    services.xserver.enable = true;
    services.desktopManager.plasma6.enable = true;

    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

    # printing
    services.printing.enable = true;

    # audio
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # user
    users.users."wolf" = {
      isNormalUser = true;
      description = "wolf";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      packages = with pkgs; [
        kdePackages.kate
      ];
    };

    # packages
    programs.firefox.enable = true;
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      vim
      git
      wget
      xwayland-satellite
    ];

    home-manager.users.wolf = self.homeModules.wolf;

    system.stateVersion = "26.05";
  };
}
