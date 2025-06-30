{
  inputs.import-tree.url = "github:vic/import-tree";
  inputs.nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";
  outputs = inputs: import ./. inputs;
}
