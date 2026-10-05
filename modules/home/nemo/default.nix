{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nemo-with-extensions
  ];

  home.file.".local/share/nemo/actions/kitty.nemo_action".text = ''
    [Nemo Action]
    Active=true
    Name=Open in Kitty
    Exec=kitty --working-directory %P
    Selection=none
    Extensions=any;
    Icon-Name=utilities-terminal
  '';

  dconf.settings = {
    "org/nemo/preferences" = {
      show-hidden-files = true;
      show-full-path-titles = true;
      terminal = "kitty";
      thumbnail-limit = 10485760;
      date-format = "iso";
    };

    "org/nemo/preferences/menu-config" = {
      selection-menu-open-in-terminal = true;
    };

    "org/nemo/window-state" = {
      start-with-sidebar = true;
      sidebar-width = 220;
    };
  };
}
