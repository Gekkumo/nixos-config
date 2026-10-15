{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Core system & Base utilities
    coreutils
    man-pages
    procps
    killall
    file
    pv

    # Archives & File systems
    trash-cli
    gnutar
    gzip
    unzip

    # Networking
    dnsutils
    openssh
    rsync
    socat
    wget
    curl

    # CLI
    ripgrep
    dust
    bat
    eza
    fd

    # NixOs
    nix-output-monitor
    nixfmt
    nixd

    # Audio & Media managment
    playerctl
    wiremix

    # Hadrware, Diagnostics & Monitoring
    smartmontools
    dmidecode
    lm_sensors
    powertop
    pciutils
    usbutils
    nvme-cli
    ddcutil

    # Grafics & Notifications
    libnotify

    # Cryptography, Secrets & Recovery
    gnupg
  ];
}
