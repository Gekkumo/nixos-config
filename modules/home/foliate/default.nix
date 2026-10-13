{ ... }:
{
  programs.foliate = {
    enable = true;
    settings = {
      "viewer/font" = {
        default-size = 12;
      };
    };
  };

  stylix.targets.foliate.enable = true;
}
