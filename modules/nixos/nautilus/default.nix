{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    nautilus
    nautilus-python
    nautilus-open-any-terminal
    file-roller
  ];

  services.gnome.sushi.enable = true;

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

  services.desktopManager.gnome.extraGSettingsOverridePackages = [
    pkgs.nautilus-open-any-terminal
  ];

  environment.sessionVariables.NAUTILUS_4_EXTENSION_DIR =
    "${config.system.path}/lib/nautilus/extensions-4";
}
