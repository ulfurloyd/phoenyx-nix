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

        theme.enable = false;

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
        ];

        globals = {
          mapleader = " ";
          maplocalleader = "\\";
          have_nerd_font = true;
        };

        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
        };

        fzf-lua.enable = true;

        lsp = {
          enable = true;
          formatOnSave = true;
        };

        languages = {
          enableTreesitter = true;

          toml.enable = true;
          bash.enable = true;
          markdown.enable = true;
          clang.enable = true;
          go.enable = true;
          python.enable = true;
          lua.enable = true;
        };

        formatter.conform-nvim = {
          enable = true;
          setupOpts = {
            formatters_by_ft = {
              lua = [ "stylua" ];
              bash = [ "shfmt" ];
              go = [ "gofmt" ];
              nix = [ "nixfmt" ];
            };
          };
          presets = {
            stylua.enable = true;
            shfmt.enable = true;
            gofmt.enable = true;
            nixfmt.enable = true;
          };
        };

        startPlugins = with pkgs.vimPlugins; [
          oil-nvim
          mini-icons
          base16-nvim
        ];

        luaConfigRC.oil = ''
          require("mini.icons").setup({})
          require("oil").setup({})
        '';

        luaConfigRC.matugen = ''
          local config = vim.fn.expand("~/.config/nvim")
          vim.opt.runtimepath:append(config)
          require("matugen").setup()
        '';
      };
    };
  };
}
