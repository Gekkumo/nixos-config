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
    ./zapret

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
    ./carla-yabridge
    ./logind
    ./zsh

    # Applications & Services
    ./virt-manager
    ./docker
    ./steam
    ./wine

    # Scripts
    ./tg-ws-proxy
    ./wireplumber-disable-hdmi-dp
  ];
}
