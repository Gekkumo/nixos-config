{ lib, ... }:
{
  services.tailscale = {
    enable = true;
    openFirewall = true;
  };

  systemd.services.tailscaled.wantedBy = lib.mkForce [ ];
}
