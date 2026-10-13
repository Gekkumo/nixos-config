{ ... }:
{
  programs.lazygit = {
    enable = true;

    settings = {
      gui = {
        showBottomLine = false;
      };
    };
  };

  stylix.targets.lazygit.enable = true;
}
