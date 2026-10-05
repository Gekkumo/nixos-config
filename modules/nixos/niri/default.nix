{ lib, ... }:
{
  programs.niri = {
    enable = true;
    useNautilus = lib.mkForce false;
  };

  xdg.portal.config.niri = {
    "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
  };

  # services.displayManager.defaultSession = lib.mkForce "niri";
}
