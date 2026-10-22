{ pkgs, ... }:
{
  services.zapret = {
    enable = false;
    package = pkgs.zapret;

    whitelist = [
      "youtube.com"
      "googlevideo.com"
      "ytimg.com"
      "youtu.be"
      "twitch.tv"
      "discord.com"
      "discordapp.com"
      "discord.gg"
      "discord.media"
      "discordapp.net"
      "live-video.net"
      "ttvnw.net"
    ];

    params = [
      # Fake + multisplit
      "--dpi-desync=fake,multisplit"
      "--dpi-desync-split-pos=1"
      "--dpi-desync-fooling=ts"
      "--dpi-desync-repeats=8"
      # Google
      "--dpi-desync=hostfakesplit"
      "--dpi-desync-hostfakesplit-mod=host=www.google.com"
      # UDP for Discord/STUN
      "--filter-udp=19294-19344,50000-50100"
      "--filter-l7=discord,stun"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=3"
      # UDP QUIC for YouTube
      "--filter-udp=443"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=11"
    ];
  };
}
