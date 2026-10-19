{ ... }: {
  flake.nixosModules.fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      fira-sans
      nerd-fonts.fira-code
    ];
  };
}
