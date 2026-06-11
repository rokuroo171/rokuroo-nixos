{
  config,
  pkgs,
  ...
}: {
  networking = {
    # hostname set in host files
    networkmanager = {
      enable = true;
    };
  };
}
