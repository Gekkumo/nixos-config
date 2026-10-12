{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    profiles.default.extensions = with pkgs.vscode-extensions; [
      eamodio.gitlens
      hashicorp.terraform
      jnoortheen.nix-ide
      ms-azuretools.vscode-docker
      ms-azuretools.vscode-containers
      ms-kubernetes-tools.vscode-kubernetes-tools
      ms-python.python
      ms-python.debugpy
      ms-python.vscode-pylance
      ms-python.vscode-python-envs
      ms-vscode.makefile-tools
      redhat.ansible
      redhat.vscode-yaml
      timonwong.shellcheck
      cweijan.dbclient-jdbc
      cweijan.vscode-database-client2
    ];

    profiles.default.userSettings = { };
  };

  home.file.".config/Code/User/settings.json" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nixos-config/modules/home/vscode/configs/vscode-settings.json";
    force = true;
  };
}
