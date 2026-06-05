{
  config,
  pkgs,
  ...
}: {
  programs = {
    # shell
    fish = {
      enable = true;
    };
    # terminal
    foot = {
      enable = true;
    };
    # prompt
    starship = {
      enable = true;
    };
  };
}
