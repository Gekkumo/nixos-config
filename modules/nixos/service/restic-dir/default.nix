{ ... }:
{
  systemd.services.create-restic-dir = {
    unitConfig.RequiresMountsFor = [ "/mnt/DATA" ];
    after = [ "mnt-DATA.mount" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      mkdir -p /mnt/DATA/Backup/IDDQD
      mkdir -p /mnt/DATA/Backup/IDKFA
      chown root:root /mnt/DATA/Backup/IDDQD /mnt/DATA/Backup/IDKFA
      chmod 0700 /mnt/DATA/Backup/IDDQD /mnt/DATA/Backup/IDKFA
    '';
  };
}
