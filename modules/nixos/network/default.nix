{ lib, pkgs, ... }:
{
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      dns = "none";
    };

    useDHCP = lib.mkDefault true;
    wireless.enable = false;
    nameservers = [ "1.1.1.1" "1.0.0.1" ];

    firewall.checkReversePath = "loose";
  };

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [ "1.1.1.1" "9.9.9.9" ];
    dnsovertls = "true";
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