{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nautilus
    gnome.nautilus-python
    nautilus-open-any-terminal
  ];

  services.gnome.sushi.enable = true;

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

  environment.sessionVariables.NAUTILUS_4_EXTENSION_DIR = "${pkgs.nautilus-python}/lib/nautilus/extensions-4";
}
