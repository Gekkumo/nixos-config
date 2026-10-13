{ username, ... }:
{
  imports = [
    ./hardware.nix
    ../../modules/disko/btrfs-layout.nix
  ];

  # Data
  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-label/data";
    fsType = "xfs";
    options = [ "noatime" "nofail" ];
  };

  # Steam
  fileSystems."/home/${username}/.local/share/Steam" = {
    device = "/.steam";
    options = [ "bind" "X-systemd.requires=/.steam" ];
  };

  # -- System modules
  # -- Enable system-level features here:

  my.system.audio = {
    enable = true;
    quantum = 512;
    minQuantum = 128;
    maxQuantum = 2048;
  };

  my.system.logind.enable = true;

  # -- User modules (Home Manager)
  # -- Enable user-level features here:
}
