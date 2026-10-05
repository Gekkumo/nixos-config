{ ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        lines = 15;
        width = 25;
        prompt = "# ";
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

  stylix.targets.fuzzel.enable = true;
}
