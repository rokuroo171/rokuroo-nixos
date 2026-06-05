{
  config,
  pkgs,
  quickshell,
  ...
}: {
  programs = {
    # widget system
    quickshell = {
      enable = true;
      package = quickshell.packages.${pkgs.system}.default;
      systemd = {
        enable = true;
      };
    };
  };
}
