{ pkgsUnstable, ... }:
{
  home.packages = with pkgsUnstable; [
    webcord
  ];
}