{ pkgs, inputs, ... }:
{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    image = ./wallpapers/wallpaper.jpg; 
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    homeManagerIntegration.autoImport = false;
    homeManagerIntegration.followSystem = true;
  };
}