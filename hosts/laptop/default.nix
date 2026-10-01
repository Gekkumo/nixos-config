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

  # logind
  my.system.logind.enable = true;

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