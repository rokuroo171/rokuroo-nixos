{ inputs, ... }: {
  imports = [ inputs.lazyvim.homeManagerModules.lazyvim ];

  programs.lazyvim = {
    enable = true;
    installCoreDepencies = true;

    extras = {
      # Languages
      lang.nix.enable = true;
      lang.go = {
       enable = true;
       installCoreDepencies = true;
      };
      lang.markdown.enable = true;
      lang.json.enable = true;

      # DAP
      dap.core.enable = true;

      # enhancements
      editor.telescope.enable = true;
      editor.dial.enable = true;

      # UI
      ui.mini-animate.enable = true;
    };

    config = {
      options = ''
        vim.opt.relativenumber = true
	vim.opt.tabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.expandtab = true
      '';
    };

    plugins = {
      colorscheme = ''
        return {
        "catppucin/nvim",
	opts = { flavour = mocha },
	}
      '';

      # vsc problem panel (extra)
      trouble = ''
        return {
	  "folke/trouble.nvim",
	  opts = {},
	}
      '';
    };
  };
}
