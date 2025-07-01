inputs:
let
  inherit (inputs.nixpkgs-lib) lib;

  dendrix =
    community
    // layers
    // {
      inherit sources;
    };

  sources = import ./dev/npins;
  community = lib.mapAttrs (_: r: r.import-tree) ev.config.dendrix.community;
  layers = ev.config.dendrix.layers;

  module = inputs.import-tree [
    ./dev/community
    ./dev/layers/options.nix
  ];

  ev = lib.modules.evalModules {
    modules = [ module ];
    specialArgs = { inherit inputs; };
  };
in
dendrix
