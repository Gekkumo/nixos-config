{ config, pkgs, inputs, ... }:
{
  programs.git = {
    enable = true;
    userName = "";
    userEmail = "";
  };

  # xdg.configFile."niri/config.kdl".source = ./niri/config.kdl;
}