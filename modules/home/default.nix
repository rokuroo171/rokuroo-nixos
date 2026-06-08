{
  config,
  pkgs,
  inputs,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit (inputs) hyprland quickshell;
    };
    users = {
      rokuroo = {
        imports = [
          ./shell.nix
          ./hyprland.nix
          ./quickshell.nix
          ./terminal.nix
          ./editor.nix
          ./apps.nix
          ./theme.nix
          ./packages.nix
        ] ++ (if config.networking.hostName == "reverie" then [
          # end-4 dots for high-end
          inputs.illogical-impulse.homeManagerModules.default
        ] else if config.networking.hostName == "opal" then [
          # caelestia for lightweight
          inputs.caelestianix.homeManagerModules.default
        ] else []);
        home = {
          stateVersion = "25.11";
        };
      };
    };
  };
}
