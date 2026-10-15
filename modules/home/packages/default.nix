{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Hadrware, Diagnostics & Monitoring
    mesa-demos

    # Cryptography, Secrets & Recovery
    restic
    sops
    age

    # IOs
    libimobiledevice
    ifuse

    # Applications
    qalculate-gtk
  ];
}
