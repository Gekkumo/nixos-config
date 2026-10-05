{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mpv
  ];

  # xdg.configFile."mpv/mpv.conf".source = ./mpv.conf;
  # xdg.configFile."mpv/input.conf".source = ./input.conf;
}
