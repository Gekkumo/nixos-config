{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nautilus
    nautilus-python
    nautilus-open-any-terminal
    file-roller
    wsdd
  ];

  services.gnome.tinysparql.enable = false;
  services.gnome.localsearch.enable = false;
  systemd.user.services.tracker-miner-fs-3.enable = false;
  systemd.user.services.tracker-extract-3.enable = false;

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

  services.desktopManager.gnome.extraGSettingsOverridePackages = [
    pkgs.nautilus-open-any-terminal
  ];
}
