{ pkgs, ... }:
{
  time.timeZone = "Europe/Moscow";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
    ];
  };

  console = {
    keyMap = "us,ru";
    font = "ter-v20b";
    packages = [ pkgs.terminus_font ];
  };
}
