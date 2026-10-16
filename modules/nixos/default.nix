{ ... }:
{
  imports = [
    # Base
    ./boot
    ./kernel
    ./locale
    ./swap
    ./oomd
    ./nix

    # Network & Security
    ./network
    ./sops
    ./ssh
    ./fail2ban
    ./zapret2

    # User & Hardware
    ./user
    ./hardware
    ./power
    ./packages
    ./codecs

    # Desktop
    ./desktop
    ./stylix
    ./getty
    ./uwsm
    ./niri
    ./nautilus
    ./hyprlock-pam
    ./fonts
    ./bluetooth
    ./audio
    ./wine
    ./carla-yabridge
    ./logind
    ./zsh

    # Applications & Services
    ./steam
    ./virt-manager
    ./docker

    # Scripts
    ./tg-ws-proxy
    ./wireplumber-disable-hdmi-dp
  ];
}
