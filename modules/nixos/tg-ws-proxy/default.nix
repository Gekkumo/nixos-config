{ ... }:
{
  virtualisation.oci-containers = {
    backend = "docker";
    containers.tg-ws-proxy = {
      image = "my-tg-ws-proxy:1.10.4";
      ports = [ "127.0.0.1:1443:1443" ];
      autoStart = true;
    };
  };
}