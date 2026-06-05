{
  config,
  pkgs,
  ...
}: {
  networking = {
    # hostname (set in host files)
    hostName = "reverie";
    # network manager
    networkmanager = {
      enable = true;
    };
  };
}
