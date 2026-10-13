{ config, lib, ... }:
{
  home.sessionVariables = lib.mkIf config.my.system.wine.enable {
    WINEPREFIX = "/.wine/default";
  };
}
