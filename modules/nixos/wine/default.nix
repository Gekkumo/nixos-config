{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.my.system.wine;
in
{
  options.my.system.wine = {
    enable = mkEnableOption "Wine";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wineWow64Packages.stable
      winetricks
    ];
  };
}
