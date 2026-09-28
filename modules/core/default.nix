{ config, pkgs, inputs, ... }:
{
  # Boot and Network
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Locale and Time
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "ru_RU.UTF-8";

  # Memory
  boot.zswap.enable = true;
  boot.kernel.sysctl."vm.swappiness" = 100;
  swapDevices = [{ device = "/swap/swapfile"; size = 8192; }];

  # Nix
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };
  nixpkgs.config.allowUnfree = true;

  # Graphics and Desktop
  hardware.graphics.enable = true;
  programs.niri.enable = true;
  services.gvfs.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    nautilus vim nano btop wget curl
    ffmpeg-full
    gst_all_1.gstreamer gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly gst_all_1.gst-libav
    gst_all_1.gst-vaapi
    libva-utils
  ];

  # User configuration
  imports = [
    ../users/gekkumo.nix
  ];

  system.stateVersion = "26.05";
}