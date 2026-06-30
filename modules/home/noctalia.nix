{ inputs, ... }: {
  imports = [ inputs.noctalia-shell.homeModules.default ];

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
}
