inputs:
inputs.flake-parts.lib.mkFlake { inherit inputs; } (
  inputs.import-tree [
    ./modules
    ./community
    ((inputs.import-tree.addPath ./layers).match ".+/layers/[^/]+.nix")
  ]
)
