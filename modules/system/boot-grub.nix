{
  config,
  pkgs,
  ...
}: {
  boot = {
    loader = {
      # bootloader
      systemd-boot = {
        enable = false;
      };
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        gfxmodeEfi = "1920x1080";
        gfxmodeBios = "1920x1080";
        gfxpayloadEfi = "keep";
        gfxpayloadBios = "keep";
        minegrub-world-sel = {
          enable = true;
          customIcons = with config.system; [
            {
              inherit name;
              lineTop = with nixos; distroName + " " + codeName + " (" + version + ")";
              lineBottom = "Survival Mode, No Cheats, Version: " + nixos.release;
              imgName = "nixos";
            }
          ];
        };
      };
      efi = {
        canTouchEfiVariables = true;
      };
      timeout = 10;
    };
    # kernel
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
