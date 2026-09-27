{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware.nix
    ./disko.nix
    ../../modules/users/gekkumo.nix
  ];

  home-manager.users.gekkumo.imports = [
    ../../modules/home/packages-desktop.nix
  ];
}