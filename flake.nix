{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixos-hardware = {
    #   url = "github:NixOS/nixos-hardware/master";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      mkHost = import ./lib/mkHost.nix { inherit inputs; };
    in
    {
      nixosConfigurations = {
        desktop = mkHost "desktop" "gekkumo" { main = "/dev/vda"; }; # /dev/nvme0n1 or /dev/nvme1n1 (lsblk)
        laptop = mkHost "laptop" "gekkumo" { main = "/dev/nvme0n1"; }; # /dev/nvme0n1 or /dev/nvme1n1 (lsblk)
      };
    };
}
