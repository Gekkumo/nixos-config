{ pkgs, inputs, username, ... }:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    age = {
      keyFile = "/home/${username}/.config/sops/age/keys.txt";
      sshKeyPaths = [ ];
    };
    
    gnupg.sshKeyPaths = [ ];
    
    # defaultSopsFile = ./secrets/secrets.yaml;
    
    validateSopsFiles = false;
    
    # Secrets Definition
    # secrets = { ... };
  };

  environment.systemPackages = with pkgs; [
    ssh-to-age
  ];
}