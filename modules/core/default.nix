{ config, pkgs, inputs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "ru_RU.UTF-8";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  boot.zswap.enable = true;
  boot.kernel.sysctl."vm.swappiness" = 100;
  swapDevices = [{
    device = "/swap/swapfile";
    size = 8192;
  }];

  environment.systemPackages = with pkgs; [
    vim
    nano
    htop
    wget
    curl
  ];

  programs.niri.enable = true;

  system.stateVersion = "26.05";
}