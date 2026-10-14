{ inputs, ... }:{
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

	      tabstop = 4;
	      softtabstop = 4;
	      shiftwidth = 4;
	      expandtab = false;

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
