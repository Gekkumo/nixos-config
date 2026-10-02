{ pkgs, ... }:
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
  };
}