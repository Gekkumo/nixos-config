{ ... }:
{
  services.getty.autologinUser = "gekkumo";

  environment.loginShellInit = ''
    if uwsm check may-start; then
      exec uwsm start niri.desktop
    fi
  '';
}
