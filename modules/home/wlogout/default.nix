{ pkgs, ... }:
{
  home.packages = with pkgs; [ wlogout ];

  xdg.configFile."wlogout/layout".source = ./configs/layout;
  xdg.configFile."wlogout/style.css".source = ./configs/style.css;
  xdg.configFile."wlogout/assets/image1.png".source = ./configs/assets/image1.png;
  xdg.configFile."wlogout/assets/image2.png".source = ./configs/assets/image2.png;
}
