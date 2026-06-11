{
  config,
  pkgs,
  ...
}: {
  users = {
    users = {
      rokuroo = {
        isNormalUser = true;
        extraGroups = [
          "wheel" # sudo access
          "networkmanager" # network
          "video" # gpu
          "audio" # sound
        ];
        shell = pkgs.fish;
        hashedPassword = "$6$7cst8z00mWzEsp.Y$ms9yKBadMh5yl6EzJQvD2o8RUV3uaVUi2Ew8wkBeUIa/VCL/RuHg9.Xi.FufCfVXGEW52AlDtEzJQDotGMrCl1";
      };
    };
  };
}
