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

  boot.kernelParams = [
    "amdgpu.dcdebugmask=0x410"
  ];

  my.system.audio = {
    enable = true;
    quantum = 256;
    minQuantum = 64;
    maxQuantum = 512;
  };

  my.system.carla-yabridge = {
    enable = true;
  };

  my.system.wine = {
    enable = true;
  };

  my.system.wireplumber.disableHdmiDp = {
    enable = true;
    devices = [ "alsa_card.pci-0000_03_00.1" ];  # (wpctl status)
  };

  # -- User modules (Home Manager)
  # -- Enable user-level features here:
}
