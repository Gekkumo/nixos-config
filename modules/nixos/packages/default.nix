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
    libimobiledevice
    ifuse

    # Applications
    pomodoro-gtk

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
  ];
}
