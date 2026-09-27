{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox-bin
    tmux
    xwayland-satellite
  ];
}