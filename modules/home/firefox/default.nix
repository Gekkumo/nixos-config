{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-bin;

    profiles.default = {
      id = 0;
      isDefault = true;
    };
  };

  stylix.targets.firefox = {
    profileNames = [ "default" ];
    firefoxGnomeTheme.enable = true;
  };
}
