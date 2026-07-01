{
  config,
  pkgs,
  ...
}: {
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
    modesetting.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
