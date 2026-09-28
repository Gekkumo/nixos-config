{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox-bin
    git
    tmux
    xwayland-satellite
    yazi
    mpv
    imv
  ];
}