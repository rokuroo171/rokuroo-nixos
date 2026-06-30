{
  config,
  pkgs,
  home-manager,
  noctalia,
  niri-flake,
  ...
}: {
  imports = [
    ../../hardware-configuration.nix
    ../../modules/system/boot.nix
    ../../modules/system/amd.nix
    ../../modules/system/audio.nix
    ../../modules/system/network.nix
    ../../modules/system/locale.nix
    ../../modules/system/users.nix
    ../../modules/system/security.nix
    ../../modules/system/display.nix
    ../../modules/system/packages.nix
    home-manager.nixosModules.home-manager
  ];

  networking.hostName = "opal";

  system.stateVersion = "26.05";

  programs.fish.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit noctalia niri-flake lazyvim; };
    users.rokuroo = {
      imports = [
        noctalia.homeModules.default
        niri-flake.homeModules.niri
        ../../modules/home/apps.nix
        ../../modules/home/theme.nix
        ../../modules/home/packages.nix
        ../../modules/home/editor.nix
        ../../modules/home/terminal.nix
      ];

      nixpkgs.config.allowUnfree = true;

      home.stateVersion = "26.05";

      programs.neovim = {
        withRuby = false;
        withPython3 = false;
      };

      programs.niri = {
        enable = true;
        settings = {
          spawn-at-startup = [ { command = [ "noctalia-shell" ]; } ];
        };
      };

      programs.noctalia-shell = {
        enable = true;
        colors = {
          mPrimary = "#c4547a";
          mOnPrimary = "#3f0020";
          mSecondary = "#8a4a5c";
          mOnSecondary = "#2a0d14";
          mTertiary = "#c8a0b4";
          mOnTertiary = "#3a1828";
          mSurface = "#1a0d0e";
          mOnSurface = "#e7e3e2";
          mSurfaceVariant = "#3d2225";
          mOnSurfaceVariant = "#a29fa3";
          mOutline = "#7a6669";
          mError = "#fa746f";
          mOnError = "#490006";
          mShadow = "#000000";
          mHover = "#301c1f";
          mOnHover = "#e7e3e2";
        };
        settings = {
          colorSchemes = {
            darkMode = true;
            generationMethod = "tonal-spot";
          };
          general = {
            avatarImage = "/home/rokuroo/.face";
          };
        };
      };
    };
  };
