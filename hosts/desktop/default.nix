{ config, pkgs, inputs, ... }:
{
  imports = [
    # ./hardware.nix
    ../../modules/users/gekkumo.nix
    ../../modules/disks/btrfs-layout.nix
  ];

  disko.devices.disk.main.device = "/dev/vda";

  # home-manager.users.gekkumo.imports = [
  #   ../../modules/home/packages-desktop.nix
  # ];
}