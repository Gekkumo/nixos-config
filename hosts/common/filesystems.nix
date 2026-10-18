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

  # VM
  fileSystems."/var/lib/libvirt/images" = {
    device = "/.vm";
    fsType = "none";
    options = [
      "bind"
      "noatime"
      "x-systemd.requires-mounts-for=/.vm"
      "x-systemd.requires-mounts-for=/var/lib/libvirt"
    ];
  };

  systemd.mounts = [
    {
      # Steam
      what = "/.steam";
      where = "/home/${username}/.local/share/Steam";
      type = "none";
      options = "bind,noatime";
      unitConfig = {
        After = [ "systemd-tmpfiles-setup.service" ];
        Requires = [ "systemd-tmpfiles-setup.service" ];
      };
    }
    {
      # Podman rootless
      what = "/.podman";
      where = "/home/${username}/.local/share/containers/storage";
      type = "none";
      options = "bind,noatime";
      unitConfig = {
        After = [ "systemd-tmpfiles-setup.service" ];
        Requires = [ "systemd-tmpfiles-setup.service" ];
      };
    }
  ];
}
