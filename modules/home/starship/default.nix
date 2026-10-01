{ ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      add_newline = false;

      command_timeout = 300;
      scan_timeout = 300;

      character = {
        success_symbol = "➜";
        error_symbol = "✗";
      };

      python = {
        detect_files = [ "requirements.txt" "pyproject.toml" "Pipfile" ".python-version" ];
        detect_extensions = [ ];
      };
      rust = {
        detect_files = [ "Cargo.toml" "Cargo.lock" ];
        detect_extensions = [ ];
      };
      golang = {
        detect_files = [ "go.mod" "go.sum" "go.work" ];
        detect_extensions = [ ];
      };
      terraform = {
        detect_files = [ "main.tf" "terraform.tfstate" ];
        detect_folders = [ ".terraform" ];
        detect_extensions = [ ];
      };
      custom.ansible_project = {
        command = "echo 'ansible'";
        when = "test -f ansible.cfg || test -f playbook.yml || test -f inventory.ini";
        format = "[$output]($style) ";
      };
      docker_context = {
        detect_files = [ "Dockerfile" "docker-compose.yml" "docker-compose.yaml" ];
      };

      git_branch = {
        format = "[$symbol$branch]($style) ";
        symbol = " ";
      };

      nix_shell = {
        format = "[$symbol$state]($style) ";
        symbol = "❄ ";
      };
    };
  };

  stylix.targets.starship.enable = true;
}