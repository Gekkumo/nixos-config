{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Core system & Base utilities
    qalculate-gtk
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
    fuse

    # Networking
    openssh
    rsync
    socat
    wget
    curl
    bind

    # CLI
    ripgrep
    zoxide
    dust
    bat
    eza
    fd

    # Terminal
    starship
    tmux
    git
    vim

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

    # Grafics & Notifications
    mesa-demos
    libnotify
    ddcutil

    # IOs
    libimobiledevice
    ifuse

    # Cryptography, Secrets & Recovery
    pinentry-gnome3
    restic
    gnupg
    sops
    age
  ];
}
