{ ... }:
{
  programs.keepassxc = {
    enable = true;

    settings = {
      GUI = {
        ApplicationTheme = "dark";
      };
    };
  };
}
