{ inputs, ... }: {
  flake.homeModules.nvim = { pkgs, ... }: {
    imports = [
      inputs.nvf.homeManagerModules.default
    ];

    programs.nvf = {
      enable = true;

      settings.vim = {
        viAlias = false;
        vimAlias = true;

        withNodeJs = true;

        mini = {
          comment.enable = true;
          pairs.enable = true;
          tabline.enable = true;
        };
        git.enable = true;

        theme.enable = false;

        ui = {
          colorizer.enable = true;
          noice.enable = true;
        };

        statusline.lualine.enable = true;

        binds.whichKey.enable = true;

        options = {
          termguicolors = true;

          tabstop = 2;
          softtabstop = 2;
          shiftwidth = 2;
          expandtab = true;

          number = true;
          relativenumber = true;
          mouse = "a";
          showmode = false;
          winborder = "rounded";

          breakindent = true;
          undofile = true;

          incsearch = true;
          hlsearch = false;
          ignorecase = true;
          smartcase = true;

          signcolumn = "yes";
          updatetime = 250;
          timeoutlen = 300;

          splitright = true;
          splitbelow = true;

          list = true;
          listchars = {
            tab = "» ";
            trail = "·";
            nbsp = "␣";
          };

          inccommand = "split";
          cursorline = true;
          scrolloff = 5;
          confirm = true;
          conceallevel = 1;
        };

        keymaps = [
          {
            key = "-";
            mode = "n";
            action = "<cmd>Oil --float<CR>";
            desc = "Open Oil file manager";
          }
          {
            key = "<leader>wv";
            mode = "n";
            action = "<C-w>v";
            desc = "Window: Open vertical split";
          }
          {
            key = "<leader>ws";
            mode = "n";
            action = "<C-w>s";
            desc = "Window: Open horizontal split";
          }
          {
            key = "<leader>wc";
            mode = "n";
            action = "<C-w>c";
            desc = "Window: Close split";
          }
          {
            key = "<leader>wr";
            mode = "n";
            action = "<C-w>r";
            desc = "Window: Rotate windows";
          }
          {
            key = "J";
            mode = "v";
            action = ":m >+1<CR>gv=gv";
            desc = "Move selection down";
          }
          {
            key = "K";
            mode = "v";
            action = ":m <-2<CR>gv=gv";
            desc = "Move selection up";
          }
          {
            key = "<leader>nr";
            mode = "n";
            action = "<cmd>restart!<CR>";
            desc = "Nvim: Restart client";
          }
          {
            key = "<leader>nL";
            mode = "n";
            action = "<cmd>Lazy<CR>";
            desc = "Nvim: Lazy";
          }
          {
            key = "<leader>cf";
            mode = "n";
            action = "<cmd>lua require('conform').format()<CR>";
            desc = "Code: Format file";
          }
          {
            key = "<leader><leader>";
            mode = "n";
            action = "<cmd>FzfLua buffers<CR>";
            desc = "List Open Buffers";
          }
          {
            key = "<leader>sf";
            mode = "n";
            action = "<cmd>FzfLua files<CR>";
            desc = "Search Files";
          }
          {
            key = "<leader>sg";
            mode = "n";
            action = "<cmd>FzfLua live_grep keymap.fzf.ctrl-q=select-all+accept actions.ctrl-q=false<CR>";
            desc = "Search by Grep";
          }
          {
            key = "<leader>sw";
            mode = "n";
            action = "<cmd>FzfLua lgrep_curbuf<CR>";
            desc = "List Open Buffers";
          }
          {
            key = "<leader>sr";
            mode = "n";
            action = "<cmd>FzfLua oldfiles<CR>";
            desc = "Search Recent Files";
          }
          {
            key = "<leader>sh";
            mode = "n";
            action = "<cmd>FzfLua helptags<CR>";
            desc = "Search Help Tags";
          }
          {
            key = "<leader>st";
            mode = "n";
            action = "<cmd>FzfLua tabs<CR>";
            desc = "Search Tabs";
          }
          {
            key = "<leader>sb";
            mode = "n";
            action = "<cmd>FzfLua builtin<CR>";
            desc = "Search Fzf Builtins";
          }
          {
            key = "<leader>tm";
            mode = "n";
            action = "<cmd>MarkdownPreviewToggle<CR>";
            desc = "Toggle Markdown Preview";
          }
          {
            key = "\\";
            mode = "n";
            action = "<cmd>lua Snacks.explorer()<CR>";
            desc = "Open Snacks explorer";
          }
          {
            key = "<leader>gg";
            mode = "n";
            action = "<cmd>lua Snacks.lazygit()<CR>";
            desc = "Snacks LazyGit";
          }
          {
            key = "<leader>gl";
            mode = "n";
            action = "<cmd>lua Snacks.lazygit.log()<CR>";
            desc = "Snacks LazyGit log";
          }
          {
            key = "<c-h>";
            mode = "n";
            action = "<cmd>ZellijNavigateLeftTab<cr>";
            desc = "navigate left or tab";
          }
          {
            key = "<c-j>";
            mode = "n";
            action = "<cmd>ZellijNavigateDown<cr>";
            desc = "navigate down";
          }
          {
            key = "<c-k>";
            mode = "n";
            action = "<cmd>ZellijNavigateUp<cr>";
            desc = "navigate up";
          }
          {
            key = "<c-l>";
            mode = "n";
            action = "<cmd>ZellijNavigateRightTab<cr>";
            desc = "navigate right or tab";
          }
        ];

        globals = {
          mapleader = " ";
          maplocalleader = "\\";
          have_nerd_font = true;
        };

        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
          registers = "unnamedplus";
        };

        fzf-lua.enable = true;

        lsp = {
          enable = true;
          formatOnSave = true;
        };

        autocomplete.blink-cmp = {
          enable = true;
          friendly-snippets.enable = true;
          setupOpts = {
            keymap = {
              preset = "default";
              "<C-space>" = [ "fallback" ];
              "<C-o>" = [ "show" ];
            };
            appearance.nerd_font_variant = "mono";
            completion.documentation.auto_show = true;
            sources.default = [
              "lsp"
              "path"
              "snippets"
              "buffer"
            ];
            fuzzy.implementation = "prefer_rust_with_warning";
          };
        };

        languages = {
          enableTreesitter = true;

          bash.enable = true;
          clang.enable = true;
          docker.enable = true;
          go.enable = true;
          json.enable = true;
          lua.enable = true;
          markdown.enable = true;
          nix.enable = true;
          python.enable = true;
          toml.enable = true;
          yaml.enable = true;
        };

        formatter.conform-nvim = {
          enable = true;
          setupOpts = {
            formatters_by_ft = {
              bash = [ "shfmt" ];
              c = [ "clang-format" ];
              cpp = [ "clang-format" ];
              go = [ "gofmt" ];
              json = [ "prettier" ];
              jsonc = [ "prettier" ];
              lua = [ "stylua" ];
              markdown = [ "prettier" ];
              nix = [ "nixfmt" ];
              sh = [ "shfmt" ];
              toml = [ "taplo" ];
              yaml = [ "prettier" ];
            };
          };
          presets = {
            clang-format.enable = true;
            gofmt.enable = true;
            nixfmt.enable = true;
            prettier.enable = true;
            ruff.enable = true;
            shfmt.enable = true;
            stylua.enable = true;
            taplo.enable = true;
          };
        };

        startPlugins = with pkgs.vimPlugins; [
          oil-nvim
          mini-icons
          base16-nvim
          zellij-nav-nvim
        ];

        luaConfigRC.oil = ''
          require("mini.icons").setup({})
          require("oil").setup({})
        '';

        luaConfigRC.zellij-nav = ''
          require("zellij-nav").setup({})
        '';

        luaConfigRC.matugen = ''
          local config = vim.fn.expand("~/.config/nvim")
          vim.opt.runtimepath:append(config)
          require("matugen").setup()
        '';

        utility = {
          preview.markdownPreview.enable = true;
          snacks-nvim = {
            enable = true;

            setupOpts = {
              bigfile.enabled = true;
              dashboard = {
                enabled = true;
                width = 80;
                sections = [
                  {
                    pane = 2;
                    section = "header";
                  }
                  {
                    section = "keys";
                    gap = 1;
                    padding = 1;
                  }
                  {
                    icon = " ";
                    title = "Recent Files";
                    section = "recent_files";
                    indent = 2;
                    padding = [
                      2
                      2
                    ];
                  }
                ];
                preset = {
                  header = ''
                             ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄          
                           ▄▀            ▄       ▀▄        
                           █  ▄    ▄              █        
                           █            ▄█▄▄  ▄   █ ▄▄▄    
                    ▄▄▄▄▄  █      ▀    ▀█  ▀▄     █▀▀ ██   
                    ██▄▀██▄█   ▄       ██    ▀▀▀▀▀    ██   
                     ▀██▄▀██        ▀ ██▀             ▀██  
                       ▀████ ▀    ▄   ██   ▄█    ▄ ▄█  ██  
                          ▀█    ▄     ██    ▄   ▄  ▄   ██  
                          ▄█▄           ▀▄  ▀▀▀▀▀▀▀▀  ▄▀   
                         █▀▀█████████▀▀▀▀████████████▀     
                         ████▀  ███▀      ▀███  ▀██▀       

                  '';
                  keys = [
                    {
                      icon = " ";
                      key = "f";
                      desc = "Find File";
                      action = ":lua Snacks.dashboard.pick('files')";
                    }
                    {
                      icon = " ";
                      key = "n";
                      desc = "New File";
                      action = ":ene | startinsert";
                    }
                    {
                      icon = " ";
                      key = "g";
                      desc = "Find Text";
                      action = ":lua Snacks.dashboard.pick('live_grep')";
                    }
                    {
                      icon = " ";
                      key = "r";
                      desc = "Recent Files";
                      action = ":lua Snacks.dashboard.pick('oldfiles')";
                    }
                    {
                      icon = " ";
                      key = "c";
                      desc = "Config";
                      action = ":lua Snacks.dashboard.pick('files', {cdw = '~/.local/share/chezmoi/dot_config/nvim'})";
                    }
                    {
                      icon = " ";
                      key = "s";
                      desc = "Restore Session";
                      section = "session";
                    }
                    {
                      icon = " ";
                      key = "G";
                      desc = "Lazygit";
                      action = ":lua require('snacks').lazygit()";
                    }
                    {
                      icon = " ";
                      key = "q";
                      desc = "Quit";
                      action = ":qa";
                    }
                  ];
                };
              };
              explorer.enabled = true;
              indent.enabled = true;
              input.enabled = true;
              picker = {
                enabled = true;
                layout.cycle = false;
              };
              notifier.enabled = true;
              quickfile.enabled = true;
              scope.enabled = true;
              scroll.enabled = true;
              statuscolumn.enabled = true;
              words.enabled = true;
            };
          };
        };
      };
    };
  };
}
