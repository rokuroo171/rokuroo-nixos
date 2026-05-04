{
  description = "my nixos configs";
  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixpkgs-unstable";
    home-manager.url = "flake:home-manager";
  };
  outputs = inputs:
    let
      flakeContext = {
        inherit inputs;
      };
    in
    {
      homeConfigurations = {
        rokuroo = import ./homeConfigurations/rokuroo.nix flakeContext;
      };
      nixosConfigurations = {
        rokuro = import ./nixosConfigurations/rokuro.nix flakeContext;
      };
      nixosModules = {
        apps = import ./nixosModules/apps.nix flakeContext;
      };
    };
}
