inputs:
inputs.flake-parts.lib.mkFlake { inherit inputs; } (
  inputs.import-tree [
    ./modules
    ./community
    ./layers/options.nix
  ]
)
