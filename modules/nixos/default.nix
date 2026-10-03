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
    ./dms-greeter
    ./niri
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
    ./tg-ws-proxy
    ./sops
  ];
}