{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    app-hider
    caffeine
    cronomix
    dash-to-dock
    prapor
    quick-lang-switch
    status-tray
    vitals
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;

      enabled-extensions = with pkgs.gnomeExtensions; [
        app-hider.extensionUuid
        caffeine.extensionUuid
        cronomix.extensionUuid
        dash-to-dock.extensionUuid
        prapor.extensionUuid
        quick-lang-switch.extensionUuid
        status-tray.extensionUuid
        vitals.extensionUuid
      ];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-input-source = [ "<Alt>Shift_L" ];
      switch-input-source-backward = [ "<Shift>Alt_L" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Shutdown";
      command = "gnome-session-quit --power-off --no-prompt";
      binding = "<Control><Alt>End";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Reboot";
      command = "gnome-session-quit --reboot --no-prompt";
      binding = "<Control><Alt>Home";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      name = "Suspend";
      command = "systemctl suspend";
      binding = "<Control><Alt>Insert";
    };
  };
}
