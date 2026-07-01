{
  description = "rokuroo-nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia-shell = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-flake.url = "github:sodiboo/niri-flake";
    niri-flake.inputs.nixpkgs.follows = "nixpkgs";
    lazyvim = {
      url = "github:pfassina/lazyvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    claude-desktop = {
      url = "github:k3d3/claude-desktop-linux-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      reverie = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit home-manager inputs; };
        modules = [
          { nixpkgs.config.allowUnfree = true; }
          ./hosts/reverie
	  {
	    home-manager.extraSpecialArgs = { inherit inputs; };
	  }
        ];
      };
      opal = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit home-manager inputs; };
        modules = [
          { nixpkgs.config.allowUnfree = true; }
          ./hosts/opal
	  {
	    home-manager.extraSpecialArgs = { inherit inputs; };
	  }
        ];
      };
    };
  };
}
