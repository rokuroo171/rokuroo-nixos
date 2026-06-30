{ inputs, ... }: {
  imports = [ inputs.niri-flake.homeModules.niri ];

  programs.niri = {
    enable = true;
    settings = {
      spawn-at-startup = [ { command = [ "noctalia-shell" ]; } ];
    };
  };
}
