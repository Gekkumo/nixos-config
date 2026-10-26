{ pkgs, ... }:
{
  home.packages = with pkgs; [
    coppwr
  ];
}
