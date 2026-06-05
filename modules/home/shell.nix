{
  config,
  pkgs,
  ...
}: {
  home = {
    packages = [
      # shell config
      pkgs.noctalia-shell
    ];
  };
}
