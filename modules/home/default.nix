{ config, pkgs, inputs, ... }:
{
  programs.git = {
    enable = true;
    userName = "";
    userEmail = "";
  };

  programs.alacritty.enable = true;
  programs.fuzzel.enable = true;

  # xdg.configFile."niri/config.kdl".source = ./niri/config.kdl;
}