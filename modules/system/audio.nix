{
  config,
  pkgs,
  ...
}: {
  services = {
    # audio server
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
      };
      pulse = {
        enable = true;
      };
      wireplumber = {
        enable = true;
      };
    };
    # media player control
    playerctld = {
      enable = true;
    };
  };

  environment = {
    systemPackages = [
      pkgs.playerctl
    ];
  };
}
