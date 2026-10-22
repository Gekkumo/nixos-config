{ username, ... }:
{
  services.getty.autologinUser = username;

  environment.loginShellInit = ''
    if uwsm check may-start; then
      exec uwsm start niri.desktop
    fi
  '';
}
