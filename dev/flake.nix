{
  outputs = inputs: import ./. inputs;

  nixConfig = {
    extra-trusted-public-keys = [
      "dendrix.cachix.org-1:OdDiPPnm0gukv156krv4p5ZWWcCpIxnlnAFvSqX1H3c="
    ];
    extra-substituters = [ "https://dendrix.cachix.org" ];
  };

  inputs = {
    dendrix.flake = false;
    dendrix.url = "path:..";
    devshell.inputs.nixpkgs.follows = "nixpkgs";
    devshell.url = "github:numtide/devshell";
    files.url = "github:mightyiam/files";
    flake-compat.url = "github:edolstra/flake-compat";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };
}
