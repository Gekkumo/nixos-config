{ ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos";
        padding = {
          top = 2;
          left = 2;
          right = 4;
        };
      };
      display = {
        separator = "  ";
      };
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "locale"
        "display"
        "de"
        "wm"
        "theme"
        "icons"
        "cursor"
        "terminal"
        "terminalfont"
        "cpu"
        "gpu"
        "memory"
        "swap"
        "disk"
        "break"
        "colors"
      ];
    };
  };
}
