{ self, ... }: {
  flake.homeModules.wolf = { pkgs, ... }: {
    imports = [
      self.homeModules.bash
      self.homeModules.umbriel
      self.homeModules.noctalia
      self.homeModules.kitty
      self.homeModules.vesktop
      self.homeModules.nvim
      self.homeModules.lazygit
      self.homeModules.zellij
      self.homeModules.shell-aliases
      self.homeModules.languages
      self.homeModules.kdeconnect
    ];

    home.packages = with pkgs; [
      helium
      ripgrep
      wl-clipboard
      gpu-screen-recorder
      mpv
      mpvpaper
      tre-command
      bat
      glib
    ];

    programs.btop.enable = true;
    programs.bash.enable = true;
    programs.git.enable = true;

    home.stateVersion = "26.05";
  };
}
