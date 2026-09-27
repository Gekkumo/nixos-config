{ config, pkgs, inputs, ... }:
{
  programs.alacritty.enable = true;
  programs.fuzzel.enable = true;

  # xdg.configFile."niri/config.kdl".source = ./niri/config.kdl;
}