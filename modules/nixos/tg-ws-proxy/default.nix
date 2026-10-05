{ ... }:
{
  virtualisation.oci-containers = {
    backend = "docker";
    containers.tg-ws-proxy = {
      image = "my-tg-ws-proxy:latest";
      ports = [ "127.0.0.1:1443:1443" ];
      autoStart = true;
      environment = {
        TG_WS_PROXY_SECRET = "09a728ea76cbeba1693333e7e14bc221";
      };
    };
  };
}
