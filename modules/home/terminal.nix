{
  config,
  pkgs,
  ...
}: {
  programs = {
    fish = {
      enable = true;
    };
    foot = {
      enable = true;
    };
    starship = {
      enable = true;
    };
  };
}
