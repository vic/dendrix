# Discovers which aspects a given community import-tree defines.
#
# Returns an attrset of where flake.modules.<class>.<aspect> was defined
#
#    { <aspect> = { <class> = [ paths ]; }; }
#
# this function will use flake-compat to load the community flake's input
# (because we want to support Unify, and any other dendritic configuration lib)
# and evaluate only a portion of it (the files included by the import-tree),
# in order to inspect the names used for `flake.modules.<class>.<name>`.
#
# currently we evaluate with system fixed to x86_64-linux, since we are likely
# running in CI to generate aspects documentation and we wont evaluate anything
# besides extracting the aspect names.
#
# inputs here are dendrix inputs, required for flake-parts and flake-compat.
{ lib, inputs }:
let
  inherit (inputs) flake-compat flake-parts;
  system = "x86_64-linux";
  discoverAspects =
    src: import-tree:
    let
      flake = import flake-compat { inherit src system; };
      flake-inputs = flake.outputs.inputs;
      evres = flake-parts.lib.evalFlakeModule { inputs = flake-inputs; } {
        systems = [ system ];
        imports = [
          inputs.flake-parts.flakeModules.modules
          import-tree # a subtree of src.
        ];
      };
      definitions = lib.pipe evres [
        (x: x.options.flake.definitionsWithLocations)
        (lib.filter (x: x ? value.modules))
        (lib.map (
          { file, value, ... }:
          lib.mapAttrsToList (
            class: aspects: lib.map (aspect: { inherit aspect class file; }) (lib.attrNames aspects)
          ) value.modules
        ))
        (lib.flatten)
        (lib.foldl (
          acc:
          {
            aspect,
            class,
            file,
          }:
          acc
          // {
            ${aspect} = (acc.${aspect} or { }) // {
              ${class} = (acc.${aspect}.${class} or [ ]) ++ [ file ];
            };
          }
        ) { })
      ];
    in
    definitions;
in
discoverAspects
