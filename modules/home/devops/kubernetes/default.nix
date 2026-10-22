{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kubectl
    kubectx
    kubernetes-helm
    kubeconform
    kustomize
    k9s
    stern
  ];
}
