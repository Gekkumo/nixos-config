{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nautilus
    nautilus-python
    nautilus-open-any-terminal
    file-roller
    wsdd
  ];

  services.gnome.tracker.enable = false;
  services.gnome.tracker-miners.enable = false;

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

  services.desktopManager.gnome.extraGSettingsOverridePackages = [
    pkgs.nautilus-open-any-terminal
  ];
}
