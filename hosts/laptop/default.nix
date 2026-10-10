{ ... }:
{
  imports = [
    ./hardware.nix
    ../../modules/disko/btrfs-layout.nix
    # ../../modules/disko/ext4-layout.nix
  ];

  # Disk configuration for this host
  _module.args.disks = {
    main = "/dev/nvme0n1"; # /dev/nvme1n1 (lsblk)
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
