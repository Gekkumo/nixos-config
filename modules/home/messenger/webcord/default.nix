{ pkgs, ... }:
{
  home.packages = with pkgs.unstable; [
    webcord
  ];
}
