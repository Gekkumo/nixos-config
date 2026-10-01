{ inputs, ... }:
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
  ];

  programs.dank-material-shell = {
    enable = true;
    niri = {
      enableKeybinds = true;
      enableSpawn = true;
    };
  };

  stylix.targets.dank-material-shell.enable = true;
}