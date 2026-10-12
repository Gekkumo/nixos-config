{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
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

      userSettings = {
        "chat.editor.fontFamily" = "FiraCode Nerd Font";
        "chat.editor.fontSize" = 16;
        "chat.fontFamily" = "Fira Sans";
        "debug.console.fontFamily" = "FiraCode Nerd Font";
        "debug.console.fontSize" = 16;
        "editor.fontFamily" = "FiraCode Nerd Font";
        "editor.fontSize" = 16;
        "editor.inlayHints.fontFamily" = "FiraCode Nerd Font";
        "editor.inlineSuggest.fontFamily" = "FiraCode Nerd Font";
        "markdown.preview.fontFamily" = "Fira Sans";
        "markdown.preview.fontSize" = 16;
        "notebook.markup.fontFamily" = "Fira Sans";
        "scm.inputFontFamily" = "FiraCode Nerd Font";
        "scm.inputFontSize" = 14;
        "screencastMode.fontSize" = 64;
        "terminal.integrated.fontSize" = 16;

        "workbench.colorTheme" = "Stylix";
        "git.enableSmartCommit" = true;
        "git.confirmSync" = false;
        "git.ignoreRebaseWarning" = true;
        "files.trimTrailingWhitespace" = true;
        "files.insertFinalNewline" = true;
        "editor.formatOnSave" = true;
        "explorer.confirmDragAndDrop" = false;
        "explorer.confirmDelete" = false;
        "workbench.browser.showInTitleBar" = true;
        "chat.titleBar.openInAgentsWindow.enabled" = false;
        "chat.titleBar.signIn.enabled" = false;
        "makefile.configureOnOpen" = true;
        "ansible.lightspeed.enabled" = false;
        "ansible.lightspeed.suggestions.enabled" = false;
        "nix.formatterPath" = "nixfmt";
        "nix.serverPath" = "nixd";
        "nix.enableLanguageServer" = true;
      };
    };
  };

  stylix.targets.vscode.fonts.enable = false;
  stylix.targets.vscode.colors.enable = false;
  stylix.targets.vscode.enable = true;
}
