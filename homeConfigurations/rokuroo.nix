{ inputs, ... }@flakeContext:
let
  homeModule = { config, lib, pkgs, ... }: {
    config = {
      home = {
        packages = [
          pkgs.fastfetch
          pkgs.spotify
          pkgs.discord
          pkgs.vscodium
          pkgs.asciiquarium
          pkgs.cmatrix
          pkgs.cava
          pkgs.lavat
          pkgs.vimPlugins.LazyVim
          pkgs.spicetify-cli
          pkgs.trash-cli
          pkgs.foot
          pkgs.starship
          pkgs.papirus-icon-theme
          pkgs.clang
          pkgs.gnumake
        ];
      };
      programs = {
        quickshell = {
          enable = true;
          systemd = {
            enable = true;
          };
        };
      };
    };
  };
  nixosModule = { ... }: {
    home-manager.users.rokuroo = homeModule;
  };
in
(
  (
    inputs.home-manager.lib.homeManagerConfiguration {
      modules = [
        homeModule
      ];
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    }
  ) // { inherit nixosModule; }
)
