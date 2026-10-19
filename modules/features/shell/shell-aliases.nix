{ ... }: {
  flake.homeModules.shell-aliases = { ... }: {
    home.shellAliases = {
      cd = "z";
      ls = "eza -lah";
      nf = "nerdfetch";
      pf = "pfetch";
      ff = "fastfetch";
      v = "nvim";
      gg = "lazygit";
      tree = "tre -e automatic";
      cz = "chezmoi";
      k = "kubectl";
      rb = "sudo nixos-rebuild switch --flake ~/Projects/phoenyxos/#$(hostname)";

      # git
      gs = "git status";
      ga = "git add";
      gaa = "git add .";
      gc = "git commit";
      gcm = "git commit -m";
      gp = "git push";
      gpl = "git pull";
      gi = "git init";
      gcl = "git clone";

      # branching
      gb = "git branch";
      gba = "git branch -a";
      gco = "git checkout";
      gcb = "git checkout -b";
      gsw = "git switch";
      gswc = "git switch -c";

      # logs and diffs
      gl = "git log --oneline --graph --decorate";
      gd = "git diff";
      gds = "git diff --staged";
    };
  };
}
