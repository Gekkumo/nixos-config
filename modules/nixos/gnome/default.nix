{ pkgs, ... }:
{
  services.desktopManager.gnome.enable = true;
  programs.dconf.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-mahjongg
    gnome-mines
    gnome-sudoku
    iagno
    hitori
    atomix
    swell-foop
    gnome-tour
    yelp
    gnome-user-docs
    gnome-music
    gnome-photos
    loupe
    totem
    cheese
    epiphany
  ];
}