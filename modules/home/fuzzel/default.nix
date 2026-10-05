{ ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        lines = 12;
        width = 35;
        prompt = "> ";
        terminal = "kitty -e";
        icons-enabled = true;
        dpi-aware = "auto";
      };

      border = {
        radius = 2;
        width = 2;
      };
    };
  };

  stylix.targets.fuzzel.enable = true;
}
