{ pkgs, ... }:
{
  home.packages = with pkgs; [
    yamllint
    shellcheck
    shfmt
  ];
}
