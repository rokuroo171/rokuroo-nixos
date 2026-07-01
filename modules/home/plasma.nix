{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    kdePackages.kate
    kdePackages.dolphin
    kdePackages.konsole
    kdePackages.ark
    kdePackages.okular
    kdePackages.gwenview
  ];
}
