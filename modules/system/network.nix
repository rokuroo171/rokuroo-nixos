{
  config,
  pkgs,
  ...
}: {
  networking = {
    # hostname is set per-host in hosts/<host>/default.nix
    # network manager
    networkmanager = {
      enable = true;
    };
  };
}
