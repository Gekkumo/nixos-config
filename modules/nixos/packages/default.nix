{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Core
    git
    tmux
    vim
    wget
    curl
    ripgrep
    zoxide
    starship
    fd
    file
    sops
    age
    pv
    nixd
    nixfmt

    # CLI
    bat
    trash-cli
    dust
    nix-output-monitor
    killall
    restic
    eza

    # System Utilities
    coreutils
    procps
    gnutar
    gzip
    unzip
    man-pages
    pciutils
    usbutils
    dmidecode
    smartmontools
    nvme-cli
    libnotify
    libimobiledevice
    ifuse
    fuse

    # Network
    bind
    rsync
    socat
    openssh

    # Security & Secrets
    gnupg
    pinentry-gnome3

    # GPU
    mesa-demos
    ddcutil

    # Monitoring
    lm_sensors
    powertop

    # Applications
    qalculate-gtk
  ];
}
