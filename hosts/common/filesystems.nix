{ username, ... }:
{
  # Data
  fileSystems."/mnt/DATA" = {
    device = "/dev/disk/by-label/DATA";
    fsType = "xfs";
    options = [
      "noatime"
      "nofail"
      "x-systemd.device-timeout=5s"
    ];
  };

  # Podman-rootless
  fileSystems."/home/${username}/.local/share/containers/storage" = {
    device = "/.podman";
    fsType = "none";
    options = [
      "bind"
      "x-systemd.requires-mounts-for=/.podman"
    ];
  };

  # Steam
  fileSystems."/home/${username}/.local/share/Steam" = {
    device = "/.steam";
    fsType = "none";
    options = [
      "bind"
      "x-systemd.requires-mounts-for=/.steam"
    ];
  };

  # VM
  fileSystems."/var/lib/libvirt/images" = {
    device = "/.vm";
    fsType = "none";
    options = [
      "bind"
      "x-systemd.requires-mounts-for=/.vm"
    ];
  };
}
