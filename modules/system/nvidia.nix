{
  config,
  pkgs,
  ...
}: {
  services.xserver.videoDrivers = [ "nouveau" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  boot.kernelParams = [ "nouveau.config=NvGspRm=0" ];
}
