{ config, pkgs, inputs, ... }:
{
  programs.alacritty.enable = true;

  # xdg.configFile."niri/config.kdl".source = ./niri/config.kdl;
}