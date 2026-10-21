{ lib, hostName, ... }:
let
  hostConfig =
    {
      desktop = ./configs/desktop.kdl;
      laptop = ./configs/laptop.kdl;
    }
    .${hostName} or null;
in
{
  xdg.configFile."niri/config.kdl".source = ./configs/config.kdl;

  xdg.configFile."niri/host.kdl" = lib.mkIf (hostConfig != null) {
    source = hostConfig;
  };
}
