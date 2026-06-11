{
  description = "rokuroo-nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";
    silentSDDM.url = "github:uiriansan/SilentSDDM";
    silentSDDM.inputs.nixpkgs.follows = "nixpkgs";
    noctalia.url = "github:noctalia-dev/noctalia/legacy-v4";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";
    niri-flake.url = "github:sodiboo/niri-flake";
    niri-flake.inputs.nixpkgs.follows = "nixpkgs";
  };

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  outputs = { self, nixpkgs, home-manager, hyprland, silentSDDM, noctalia, niri-flake, ... }: {
    nixosConfigurations = {
      reverie = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit home-manager hyprland silentSDDM; };
        modules = [
          { nixpkgs.config.allowUnfree = true; }
          ./hosts/reverie
        ];
      };
      opal = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit home-manager silentSDDM noctalia niri-flake; };
        modules = [
          { nixpkgs.config.allowUnfree = true; }
          ./hosts/opal
        ];
      };
    };
  };
}
