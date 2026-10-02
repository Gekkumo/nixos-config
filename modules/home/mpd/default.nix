{ config, pkgs, ... }:
{
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    playlistDirectory = "${config.home.homeDirectory}/Music/playlists";

    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Sound Server"
      }
      restore_paused "yes"
      auto_update "yes"
    '';
  };

  systemd.user.tmpfiles.rules = [
    "d ${config.home.homeDirectory}/Music/playlists 0755 - - -"
  ];
}