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
    ./udisks
    ./packages
    ./codecs

    # Desktop
    ./desktop
    ./stylix
    ./getty
    ./uwsm
    ./niri
    ./hyprlock-pam
    ./fonts
    ./bluetooth
    ./audio
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
