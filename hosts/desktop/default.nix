{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware.nix
    ../../modules/disko/btrfs-layout.nix
  ];

  # Disk configuration for this host
  _module.args.disks = {
    main = "/dev/vda"; # /dev/nvme0n1 or /dev/nvme1n1 (lsblk)
  };

  # -- System modules
  # -- Enable system-level features here:

  # PipeWire
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
