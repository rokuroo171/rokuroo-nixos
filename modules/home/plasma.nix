{
  config,
  pkgs,
  ...
}: {
  services.xserver.desktopManager.plasma6.enable = true;

  home.packages = with pkgs; [
    kdePackages.kate
    kdePackages.dolphin
    kdePackages.konsole
    kdePackages.ark
    kdePackages.okular
    kdePackages.gwenview
  ];
}
