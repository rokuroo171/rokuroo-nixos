{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
      pkgs.app2unit
      pkgs.git
      pkgs.wget
      pkgs.vim
      pkgs.btop
      pkgs.jq
      pkgs.eza
      pkgs.wl-clipboard
      pkgs.cliphist
      pkgs.inotify-tools
      pkgs.nmap
      pkgs.iputils
      pkgs.dnsutils
      pkgs.nautilus
      pkgs.nerd-fonts.jetbrains-mono
    ];
  };

  programs.nix-ld = {
    enable = true;
  };

  services = {
    # file manager services
    gvfs = {
      enable = true;
    };
    tumbler = {
      enable = true;
    };
  };
}
