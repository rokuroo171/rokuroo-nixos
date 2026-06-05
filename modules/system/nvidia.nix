{
  config,
  pkgs,
  ...
}: {
  hardware = {
    nvidia = {
      # needed for wayland
      modesetting.enable = true;

      # proprietary driver
      open = false;

      nvidiaSettings = true;

      # power mgmt for gt1030
      powerManagement.enable = true;

      # pascal doesnt support this
      powerManagement.finegrained = false;

      # stable driver
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      prime = {
        offload = {
          enable = false;
          enableOffloadCmd = false;
        };
        # for hybrid gpu
        # intelBusId = "PCI:0:2:0";
        # nvidiaBusId = "PCI:1:0:0";
      };
    };

    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
      ];
    };
  };

  # nvidia driver modules
  boot.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_drm" "nvidia_uvm" ];

  # drm for wayland
  boot.kernelParams = [ "nvidia_drm.modeset=1" ];

  # blacklist open source driver
  boot.blacklistedKernelModules = [ "nouveau" ];

  environment = {
    systemPackages = with pkgs; [
      # nvidia-container-toolkit # for docker
    ];

    sessionVariables = {
      LIBVA_DRIVER_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      NIXOS_OZONE_WL = "1";
      VDPAU_DRIVER = "nvidia";
      # for gt1030 vram
      __GL_THREADED_OPTIMIZATIONS = "1";
    };
  };

  # for cuda dev
  # services.nvidia-persistenced.enable = true;
}
