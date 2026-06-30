{
  config,
  pkgs,
  ...
}: {
  services.xserver.videoDrivers = [ "intel" "nouveau" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };

  boot.kernelParams = [ "nouveau.config=NvGspRm=0" ];
}
