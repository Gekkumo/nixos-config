{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox-bin
    alacritty
    tmux
  ];
}