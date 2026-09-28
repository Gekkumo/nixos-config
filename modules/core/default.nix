{ config, pkgs, inputs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "ru_RU.UTF-8";

  hardware.graphics.enable = true;

  system.stateVersion = "26.05";

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

  nix.settings = {
    extra-substituters = [
      "https://noctalia.cachix.org"
    ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    nautilus
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
}