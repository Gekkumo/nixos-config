{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-bin;
  };

  stylix.targets.firefox.profileNames = [ "default" ];
}