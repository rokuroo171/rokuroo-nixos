{
  config,
  pkgs,
  ...
}: {
  time = {
    # timezone
    timeZone = "Asia/Jakarta";
  };

  i18n = {
    # locale
    defaultLocale = "en_US.UTF-8";
  };
}
