{ ... }:{
  flake.homeModules.bash = { pkgs, ... }:{
    programs.eza = {
      enable = true;
      enableBashIntegration = true;
    };

    programs.fzf = {
      enable = true;
      enableBashIntegration = true;
    };

    programs.zoxide = {
      enable = true;
      enableBashIntegration = true;
    };

    programs.bash = {
      enable = true;

      shellAliases = {
        cd = "z";
        ls = "exa -lah";
        nf = "nerdfetch";
        pf = "pfetch";
        ff = "fastfetch";
        v = "nvim";
        gg = "lazygit";
        tree = "tre -e automatic";
        cz = "chezmoi";
        k = "kubectl";
        
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

      historyControl = [ "ignoredups" "ignorespace" ];

      initExtra = ''
        function y() {
          local tmp cwd
          tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
          command yazi "$@" --cwd-file="$tmp"
          IFS= read -r -d $'\0' cwd <"$tmp"
          [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
          command rm -f -- "$tmp"
        }

        # fzf integration
        eval "$(fzf --bash)"

        # Flyline's fzf directory integration
        function flyline_fzf_cd() {
          local cmd
          cmd=$(__fzf_cd__) && READLINE_LINE="$cmd" READLINE_POINT=''${#cmd}
        }

        # Prompt
        export PS1='\e[01;32m\u@\h\e[00m:\e[01;34m\w\e[00m\n> '
        export RPS1='\e[01;33m\t\e[00m'

        # Flyline
        enable flyline 2>/dev/null

        flyline history --backend flyline
        flyline key bind Ctrl+f inlineSuggestionAvailable=inlineSuggestionAccept
        flyline key bind Ctrl+n always=nextHistoryEntry
        flyline key bind Ctrl+p always=prevHistoryEntry
        flyline key bind Ctrl+n fuzzyHistorySearch=fuzzyHistorySelectNext
        flyline key bind Ctrl+p fuzzyHistorySearch=fuzzyHistorySelectPrev
        flyline key bind Ctrl+n tabCompletionAvailable=tabCompletionMoveDown
        flyline key bind Ctrl+p tabCompletionAvailable=tabCompletionMoveUp

        flyline key bind Ctrl+t 'always=runBashCommand(fzf-file-widget)'
        flyline key bind Alt+c 'always=runBashCommand(flyline_fzf_cd)+submitOrNewline'

        # Zoxide
        eval "$(zoxide init bash)"

        # Matugen-generated terminal colors
        if [[ -r "$HOME/.cache/terminal-sequences" ]]; then
          cat "$HOME/.cache/terminal-sequences"
        fi

        # History
        shopt -s histappend
        PROMPT_COMMAND+=(
          'history -a'
          'history -n'
        )
      '';
    };

    home.sessionPath = [
      "$HOME/go/bin"
    ];
  };
}
