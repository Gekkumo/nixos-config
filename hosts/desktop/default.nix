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

  # Greeter monitor
  my.greetd = {
    monitor = "Virtual-1"; # HDMI-A-1 or DP-1 (niri msg outputs)
    resolution = "1920x1080"; # 2560x1440 (niri msg outputs)
    refreshRate = "60.000"; # "143.912" or "?" (niri msg outputs)
    cageOrder = "first";
  };

  # PipeWire
  my.system.audio = {
    enable = true;
    quantum = 256;
    minQuantum = 64;
    maxQuantum = 512;
  };

  my.system.wireplumber.disableHdmiDp = {
    enable = true;
    devices = [ "alsa_card.pci-0000_03_00.1" ];  # (wpctl status)
  };

  # -- User modules (Home Manager)
  # -- Enable user-level features here:
}
