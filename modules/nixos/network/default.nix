{ lib, pkgs, ... }:
{
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
    };

    useDHCP = lib.mkDefault true;
    nameservers = [ "1.1.1.1" "1.0.0.1" ];

    firewall.checkReversePath = "loose";
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSSEC = "true";
      Domains = [ "~." ];
      DNSOverTLS = "true";
      FallbackDNS = [ "1.1.1.1" "9.9.9.9" ];
    };
  };

  programs.ssh = {
    startAgent = false;
    enableAskPassword = false;
    extraConfig = ''
      Host *
        ServerAliveInterval 60
        ServerAliveCountMax 3
        TCPKeepAlive yes
        ConnectTimeout 30
    '';
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    wireguard-tools
  ];

  environment.shellAliases = {
    sshtest = "ssh -o ConnectTimeout=5 -o BatchMode=yes";
  };
}