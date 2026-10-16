{
  pkgs,
  inputs,
  config,
  username,
  ...
}:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    age = {
      keyFile = "/home/${username}/.config/sops/age/keys.txt";
      sshKeyPaths = [ ];
    };

    gnupg.sshKeyPaths = [ ];

    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    validateSopsFiles = false;

    secrets = {
      "tg_ws_proxy_secret" = {
        owner = "root";
        mode = "0400";
      };
    };

    # Templates
    templates."tg-ws-proxy.env".content = ''
      TG_WS_PROXY_SECRET=${config.sops.placeholder."tg_ws_proxy_secret"}
    '';
  };

  environment.systemPackages = with pkgs; [
    sops
    age
    ssh-to-age
  ];
}
