{ pkgs, ... }:
{
  programs.uwsm = {
    enable = true;
    waylandCompositors.niri = {
      binPath = "${pkgs.niri}/bin/niri-session";
      prettyName = "Niri";
    };
};
}
