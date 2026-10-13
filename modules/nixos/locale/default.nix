{ ... }:
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
    keyMap = "us";
    earlySetup = true;
  };

  systemd.services.systemd-vconsole-setup.unitConfig.After = [ "local-fs.target" ];
}
