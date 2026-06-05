{
  config,
  pkgs,
  ...
}: {
  security = {
    # permission manager
    polkit = {
      enable = true;
    };
  };
}
