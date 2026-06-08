{
  description = "rokuroo-nixos configuration";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    illogical-impulse = {
      url = "github:bigsaltyfishes/end-4-dots";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestianix = {
      url = "github:Xellor-Dev/caelestia-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    quickshell,
    silentSDDM,
    illogical-impulse,
    caelestianix,
    ...
  }: {
    nixosConfigurations = {
      reverie = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs hyprland quickshell silentSDDM illogical-impulse;
        };
        modules = [
          ./hosts/reverie
        ];
      };

      opal = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs hyprland quickshell silentSDDM caelestianix;
        };
        modules = [
          ./hosts/opal
        ];
      };
    };
  };
}
