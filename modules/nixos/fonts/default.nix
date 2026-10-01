{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.fira-code

      noto-fonts-color-emoji

      liberation_ttf
      dejavu_fonts
    ];

    fontconfig.useEmbeddedBitmaps = true;
    fontconfig.defaultFonts.emoji = [ "Noto Color Emoji" ];
  };
}