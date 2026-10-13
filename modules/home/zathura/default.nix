{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zathura
    zathuraPkgs.zathura_pdf_mupdf
  ];

  stylix.targets.zathura.enable = true;
}
