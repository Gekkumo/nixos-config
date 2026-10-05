{ ... }:
{
  programs.btop = {
    enable = true;
    settings = {
      update_ms = 2000;
    };
  };

  stylix.targets.btop.enable = true;
}
