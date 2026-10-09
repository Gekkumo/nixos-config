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
    ./ssh
    ./fail2ban

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
    ./steam
    ./virt-manager
    ./docker
    ./gnupg
    ./sops

    # Scripts
    ./tg-ws-proxy
    ./wireplumber-disable-hdmi-dp
  ];
}
