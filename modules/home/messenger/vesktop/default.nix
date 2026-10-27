{ pkgs, ... }:
{
  home.packages = with pkgs; [
    unstable.vesktop
  ];
}
