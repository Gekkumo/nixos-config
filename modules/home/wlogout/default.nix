{ pkgs, ... }:
{
  programs.wlogout.enable = true;

  # home.packages = with pkgs; [
  #   wlogout
  # ];

  # xdg.configFile."wlogout/layout".source = ./configs/layout;
  # xdg.configFile."wlogout/style.css".source = ./configs/style.css;
}
