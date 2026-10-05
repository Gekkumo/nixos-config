{ pkgs, inputs, ... }:
{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    image = ./wallpapers/wallpaper.jpg;
    polarity = "dark";

    # Sequoia Monochrome Dark
    base16Scheme = {
      base00 = "0f1014";
      base01 = "111216";
      base02 = "111216";
      base03 = "43444d";
      base04 = "575861";
      base05 = "868690";
      base06 = "868690";
      base07 = "0f1014";
      base08 = "999eb2";
      base09 = "999eb2";
      base0A = "d3d5de";
      base0B = "626983";
      base0C = "b6bac8";
      base0D = "7c829d";
      base0E = "d3d5de";
      base0F = "626983";
    };

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
