{ pkgs, inputs, ... }:
{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    image = ./wallpapers/wallpaper.jpg;
    polarity = "dark";
    base16Scheme = ./sequoia-monochrome-dark.json;

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };
      sansSerif = {
        package = pkgs.fira-sans;
        name = "Fira Sans";
      };
      serif = {
        package = pkgs.fira-sans;
        name = "Fira Sans";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };

    homeManagerIntegration.autoImport = true;
    homeManagerIntegration.followSystem = true;
  };
}
