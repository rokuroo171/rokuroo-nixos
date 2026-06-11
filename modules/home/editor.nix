{
  config,
  pkgs,
  ...
}: {
  programs = {
    neovim = {
      enable = true;
      plugins = [
        pkgs.vimPlugins.LazyVim
      ];
    };
    vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
  };
}
