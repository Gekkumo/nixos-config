{ ... }:
{
  programs.btop = {
    enable = true;
    settings = {
      update_ms = 2000;
    };
  };
}
