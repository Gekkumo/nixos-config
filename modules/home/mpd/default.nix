{ config, pkgs, ... }:
{
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    playlistDirectory = "${config.home.homeDirectory}/Music/playlists";

    settings = {
      audio_output = [
        {
          type = "pipewire";
          name = "PipeWire Sound Server";
        }
      ];
      restore_paused = "yes";
      auto_update = "yes";
    };
  };

  systemd.user.services.mpd.Service.ExecStartPre = 
    "${pkgs.coreutils}/bin/mkdir -p ${config.home.homeDirectory}/Music/playlists";
}