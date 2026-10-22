{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.symbols-only
      noto-fonts-color-emoji
      liberation_ttf
      dejavu_fonts
    ];

    fontconfig.useEmbeddedBitmaps = true;
    fontconfig.defaultFonts.emoji = [ "Noto Color Emoji" ];
  };
}
