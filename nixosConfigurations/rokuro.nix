{ inputs, ... }@flakeContext:
let
  nixosModule = { config, lib, pkgs, ... }: {
    config = {
      boot = {
        kernelPackages = pkgs.linuxPackages;
        loader = {
          efi = {
            canTouchEfiVariables = true;
          };
          systemd-boot = {
            enable = true;
          };
        };
      };
      environment = {
        sessionVariables = {
          LIBVA_DRIVER_NAME = "nvidia";
          GBM_BACKEND = "nvidia-drm";
          __GLX_VENDOR_LIBRARY_NAME = "nvidia";
          WLR_NO_HARDWARE_CURSORS = "1";
          NIXOS_OZONE_WL = "1";
        };
        systemPackages = [
          pkgs.xdg-desktop-portal
          pkgs.xdg-desktop-portal-gtk
          pkgs.xdg-desktop-portal-hyprland
          pkgs.app2unit
          pkgs.wireplumber
          pkgs.qtengine
          pkgs.nerd-fonts.jetbrains-mono
          pkgs.pipewire
          pkgs.networkmanager
          pkgs.where-is-my-sddm-theme
        ];
      };
      hardware = {
        graphics = {
          enable = true;
        };
        nvidia = {
          modesetting = {
            enable = true;
          };
        };
      };
      networking = {
        networkmanager = {
          enable = true;
        };
      };
      programs = {
        fish = {
          enable = true;
        };
        foot = {
          enable = true;
        };
        hyprland = {
          enable = true;
          xwayland = {
            enable = true;
          };
        };
        neovim = {
          enable = true;
        };
      };
      services = {
        displayManager = {
          sddm = {
            enable = true;
            theme = "where_is_my_sddm_theme";
            wayland = {
              enable = true;
            };
          };
        };
        pipewire = {
          alsa = {
            enable = true;
          };
          enable = true;
          pulse = {
            enable = true;
          };
        };
        playerctld = {
          enable = true;
        };
      };
      system = {
        stateVersion = "25.11";
      };
      time = {
        timeZone = "Asia/Jakarta";
      };
      users = {
        users = {
          rokuroo = {
            extraGroups = [
              "wheel"
              "networkmanager"
              "video"
              "audio"
            ];
            isNormalUser = true;
            password = "rakka123";
            shell = pkgs.fish;
          };
        };
      };
    };
  };
in
inputs.nixpkgs.lib.nixosSystem {
  modules = [
    nixosModule
  ];
  system = "x86_64-linux";
}
