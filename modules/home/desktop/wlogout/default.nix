{ pkgs, ... }:
{
  home.packages = with pkgs; [ wlogout ];

  xdg.configFile."wlogout/layout".source = ./configs/layout;
  xdg.configFile."wlogout/style.css".source = ./configs/style.css;
  xdg.configFile."wlogout/assets/decor_left.png".source = ./configs/assets/decor_left.png;
  xdg.configFile."wlogout/assets/decor_right.png".source = ./configs/assets/decor_right.png;
  xdg.configFile."wlogout/assets/decor_left.png".source = ./configs/assets/decor_left.png;
  xdg.configFile."wlogout/assets/decor_right.png".source = ./configs/assets/decor_right.png;
  xdg.configFile."wlogout/assets/decor_left.png".source = ./configs/assets/decor_left.png;
  xdg.configFile."wlogout/assets/decor_right.png".source = ./configs/assets/decor_right.png;
}
