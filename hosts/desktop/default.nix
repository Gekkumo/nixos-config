{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware.nix
    ../../modules/disko/btrfs-layout.nix
  ];

  # Disk configuration for this host
  disko.devices.disk.main.device = "/dev/vda";

  # -- System modules
  # -- Enable system-level features here:

  # PipeWire
  my.system.audio = {
    enable = true;
    quantum = 256;
    minQuantum = 64;
    maxQuantum = 512;
  };

  # -- User modules (Home Manager)
  # -- Enable user-level features here:
}