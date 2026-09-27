{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox-bin
    git
    tmux
    xwayland-satellite
  ];
}