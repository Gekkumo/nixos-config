{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    restic
  ];

  services.restic.backups = {
    obsidian = {
      initialize = true;
      repository = "/mnt/DATA/Backup/Obsidian";
      passwordFile = "${config.home.homeDirectory}/.config/restic/password";

      paths = [
        "${config.home.homeDirectory}/Documents/IDDQD"
      ];

      exclude = [
        "${config.home.homeDirectory}/Documents/IDDQD/.git"
        "${config.home.homeDirectory}/Documents/IDDQD/.gitignore"
        "${config.home.homeDirectory}/Documents/IDDQD/.trash"
      ];

      timerConfig = {
        OnCalendar = "Sun *-*-* 12:00:00";
        Persistent = true;
        RandomizedDelaySec = "5m";
      };
    };

    keepass = {
      initialize = true;
      repository = "/mnt/DATA/Backup/KeePass";
      passwordFile = "${config.home.homeDirectory}/.config/restic/password";

      paths = [
        "${config.home.homeDirectory}/Documents/KeePass"
      ];

      timerConfig = {
        OnCalendar = "Sun *-*-* 12:00:00";
        Persistent = true;
        RandomizedDelaySec = "5m";
      };
    };
  };
}
