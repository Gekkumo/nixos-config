{ pkgsUnstable, ... }:
{
  services.zapret2 = {
    enable = true;
    package = pkgsUnstable.zapret2;

    profiles.default.parameters = [
      # TLS
      "--filter-tcp=443"
      "--payload=tls_client_hello"
      "--lua-desync=fake:blob=fake_default_tls:tcp_md5"
      "--lua-desync=multisplit:pos=1,midsld"

      # QUIC
      "--filter-udp=443"
      "--payload=quic_initial"
      "--lua-desync=fake:blob=fake_default_quic:ip_ttl=3"
    ];

    profiles.default.hosts.include = [
      "youtube.com"
      "googlevideo.com"
      "ytimg.com"
      "youtu.be"
      "twitch.tv"
      "discord.com"
      "discordapp.com"
    ];
  };
}
