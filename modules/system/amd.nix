{
  config,
  pkgs,
  ...
}: {
  hardware = {
    graphics = {
      enable = true;
    };
    # amd gpu driver (load amdgpu early via initrd)
    amdgpu = {
      initrd = {
        enable = true;
      };
    };
  };

  boot = {
    initrd = {
      kernelModules = [
        "amdgpu"
        "radeon"
      ];
    };
  };

  environment = {
    systemPackages = [
      # firmware for amd
      pkgs.linux-firmware
    ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
