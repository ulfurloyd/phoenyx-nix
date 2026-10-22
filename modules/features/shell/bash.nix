{ ... }: {
  flake.homeModules.bash = { pkgs, ... }: {
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

      historyControl = [
        "ignoredups"
        "ignorespace"
      ];

      initExtra = ''
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

    home.sessionVariables = {
      KUBECONFIG = "/home/wolf/.kube/config";
    };
  };
}
