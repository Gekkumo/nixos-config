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

  imports = [
    ../users/gekkumo.nix
  ];

  hardware.graphics.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    nano
    btop
    wget
    curl
    ffmpeg-full
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    gst_all_1.gst-vaapi
    libva-utils # change
  ];

  programs.niri.enable = true;

  system.stateVersion = "26.05";
}