# Default: list recipes
default:
    @just --list

# Build the configuration (does not activate)
build host="desktop":
    nixos-rebuild build --flake .#{{host}}

# Activate the configuration (boot)
boot host="desktop":
    nixos-rebuild boot --flake .#{{host}}

# Activate the configuration (switch)
switch host="desktop":
    nixos-rebuild switch --flake .#{{host}}

# Update flake inputs and rebuild
update:
    nix flake update
    @just boot

# Run garbage collection manually
gc:
    nh clean all --keep 3 --keep-since 14d

# Check flake eval
check:
    nix flake check
