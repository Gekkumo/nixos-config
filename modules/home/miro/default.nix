{ pkgs, ... }:
{
  home.packages = with pkgs; [
    miro
  ];
}