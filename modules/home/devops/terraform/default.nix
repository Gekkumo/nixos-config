{ pkgs, ... }:
{
  home.packages = with pkgs; [
    terraform
    tflint
    terraform-docs
  ];
}
