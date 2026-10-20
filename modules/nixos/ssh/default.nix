{ ... }:
{
  services.openssh = {
    enable = true;
    ports = [ 62419 ];
    openFirewall = true;

    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      MaxAuthTries = 3;
    };
  };
}
