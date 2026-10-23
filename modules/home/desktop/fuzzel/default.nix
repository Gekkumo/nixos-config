{ ... }:
{
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        lines = 15;
        width = 45;
        prompt = "$";
        terminal = "kitty -e";
        icons-enabled = false;
        dpi-aware = "auto";
      };

      border = {
        radius = 2;
        width = 2;
      };
    };
  };
}
