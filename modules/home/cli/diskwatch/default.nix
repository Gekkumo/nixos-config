{ pkgs, ... }:
{
  home.packages = [
    pkgs.unstable.diskwatch
  ];
}
