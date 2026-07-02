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
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lazyvim = {
      url = "github:pfassina/lazyvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    claude-cowork-nix = {
      url = "github:Reginleif88/claude-cowork-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    minegrub-world-sel-theme = {
      url = "github:Lxtharia/minegrub-world-sel-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  outputs = inputs @ { self, nixpkgs, home-manager, minegrub-world-sel-theme, ... }: {
    nixosConfigurations = {
      reverie = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit home-manager inputs minegrub-world-sel-theme; };
        modules = [
          { nixpkgs.config.allowUnfree = true; }
          ./hosts/reverie
	  {
	    home-manager.extraSpecialArgs = { inherit inputs; };
	  }
        ];
      };
      opal = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit home-manager inputs minegrub-world-sel-theme; };
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
