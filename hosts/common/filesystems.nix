{ username, ... }:
{
  # Data
  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-label/data";
    fsType = "xfs";
    options = [ "noatime" "nofail" "x-systemd.device-timeout=5s" ];
  };

  # Steam
  fileSystems."/home/${username}/.local/share/Steam" = {
    device = "/.steam";
    fsType = "none";
    options = [ "bind" "x-systemd.requires-mounts-for=/.steam" ];
  };
}
