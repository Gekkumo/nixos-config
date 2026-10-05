{ lib, ... }:
{
  qt = {
    enable = true;
    platformTheme.name = lib.mkForce "qtct";
  };

  stylix.targets.qt.enable = true;
}
