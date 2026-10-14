{ pkgs, ... }:
{
  home.packages = [ pkgs.mpdris2-rs ];

  systemd.user.services.mpdris2-rs = {
    Unit = {
      Description = "MPD MPRIS2 Bridge";
      After = [ "mpd.service" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.mpdris2-rs}/bin/mpdris2-rs --no-notification";
      Restart = "on-failure";
      RestartSec = "3s";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
