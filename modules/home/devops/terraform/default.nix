{ pkgs, ... }:
{
  home.packages = with pkgs; [
    terraform
    tflint
    terraform-docs
    terraform-ls
  ];
}
