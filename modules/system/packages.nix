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
      pkgs.efibootmgr
      pkgs.nautilus
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.go
      pkgs.nodejs
      pkgs.gcc
      pkgs.clang
      pkgs.steam-run
      pkgs.devin-cli
      pkgs.cursor-cli
    ];
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glib
      nss
      nspr
      atk
      cups
      libdrm
      mesa
      alsa-lib
      expat
      libx11
      libxcb
      libxcomposite
      libxdamage
      libxext
      libxfixes
      libxrandr
      gtk3
      pango
      cairo
      dbus
      mesa
      libgbm
    ];
    # package = pkgs.nix-ld;
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
