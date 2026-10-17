{ lib, pkgs, ... }:
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

  programs.firefox.profiles.default.settings = {
    "font.name.sans-serif.x-western" = lib.mkForce "Fira Sans, Symbols Nerd Font";
    "font.name.monospace.x-western" = lib.mkForce "FiraCode Nerd Font, Symbols Nerd Font";
    "font.name-list.sans-serif.x-western" = "Fira Sans, Symbols Nerd Font";
    "font.name-list.monospace.x-western" = "FiraCode Nerd Font, Symbols Nerd Font";
  };
}
