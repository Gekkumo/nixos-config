{ ... }:
{
  programs.uwsm = {
    enable = true;
    waylandCompositors.niri = {
      binPath = "/run/current-system/sw/bin/niri-session";
      prettyName = "Niri";
    };
  };
}
