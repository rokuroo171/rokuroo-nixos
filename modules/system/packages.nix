{
  config,
  pkgs,
  ...
}: {
  environment = {
    # required by home-manager xdg.portal when useUserPackages is enabled,
    # so portal definitions and DE-provided configs get linked into the profile
    pathsToLink = [
      "/share/applications"
      "/share/xdg-desktop-portal"
    ];
    systemPackages = [
      # xdg portals
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
      pkgs.app2unit
      # basic tools
      pkgs.git
      pkgs.wget
      pkgs.vim
      pkgs.btop
      pkgs.jq
      pkgs.eza
      # wayland clipboard
      pkgs.wl-clipboard
      pkgs.cliphist
      pkgs.inotify-tools
      # network tools
      pkgs.nmap
      pkgs.iputils
      pkgs.dnsutils
      # file manager
      pkgs.nautilus
      # fonts
      pkgs.nerd-fonts.jetbrains-mono
    ];
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
