{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware.nix
    ../../modules/disko/btrfs-layout.nix
  ];

  # Disk configuration for this host
  _module.args.disks = {
    main = "/dev/nvme0n1"; # /dev/nvme1n1 (lsblk)
  };

  # -- System modules
  # -- Enable system-level features here:

  # logind
  my.system.logind.enable = true;

  # Greeter monitor
  my.greetd = {
    monitor = "eDP-1"; # or DP-1 (niri msg outputs)
    resolution = "1920x1080"; # 2560x1440 (niri msg outputs)
    # refreshRate = "60.000"; # "?" (niri msg outputs)
    cageOrder = "first";
  };

  # PipeWire
  my.system.audio = {
    enable = true;
    quantum = 512;
    minQuantum = 128;
    maxQuantum = 2048;
  };

  # -- User modules (Home Manager)
  # -- Enable user-level features here:
}
