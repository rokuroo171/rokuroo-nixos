{
  config,
  pkgs,
  ...
}: {
  boot = {
    loader = {
      # bootloader
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
      timeout = 10;
    };
    # kernel
    kernelPackages = pkgs.linuxPackages;
  };
}
