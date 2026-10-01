{ ... }:
{
  programs.keepassxc = {
    enable = true;
    autostart = true;

    settings = {
      GUI = {
        ApplicationTheme = "dark";
      };
    };
  };
}