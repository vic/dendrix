{
  inputs,
  lib,
  ...
}:
let
  inherit (lib) mkOption types;

  sources = import ./../../npins;
  discoverAspects = import ./../../lib/discover.nix { inherit lib inputs; };
  default-pipeline = import ./_pipeline.nix lib;

  communityOption = mkOption {
    description = "Dendritic Community module trees.";
    default = { };
    type = types.lazyAttrsOf (
      types.submodule (
        {
          name,
          config,
          ...
        }:
        let
          repo-name = name;
          repo-cfg = config;

          community-dir =
            if builtins.pathExists "${repo-cfg.source}/modules/community" then
              "modules/community"
            else
              "modules";

          default-path = "${repo-cfg.source}/${config.community-dir}";
          default-import-tree = lib.pipe (inputs.import-tree.addPath default-path) default-pipeline;

          discovered-aspects = discoverAspects repo-cfg.source default-import-tree;
          discovered-trees = lib.pipe discovered-aspects [
            (lib.mapAttrs (
              aspect: classes: {
                import-tree = default-import-tree;
                aspects = {
                  ${aspect} = classes;
                };
              }
            ))
          ];
        in
        {
          config = {
            trees = discovered-trees;
          };
          options = {
            readme = mkOption {
              description = "Notes about using ${name} shared modules.";
              default = "No community notes on ${name}. Use the source, Luke.";
              type = types.str;
            };
            trees = mkOption {
              description = "import-tree's of shared modules";
              default = { };
              type = types.lazyAttrsOf (
                types.submodule (
                  { name, config, ... }:
                  {
                    options = {
                      readme = mkOption {
                        description = "Notes about ${name} subtree";
                        default = "${repo-name}'s ${name} tree";
                        type = types.str;
                      };
                      pipeline = mkOption {
                        description = "An pipeline to configure ${name} import-tree";
                        type = types.listOf (types.functionTo types.unspecified);
                        default = [ ];
                      };
                      flags = mkOption {
                        description = "A list of flags used in this tree files.";
                        default = config.import-tree.availableFlags;
                        readOnly = true;
                        type = types.listOf types.str;
                      };
                      aspects = mkOption {
                        description = "aspects provided on this tree";
                        default = { };
                        type = types.attrsOf (types.attrsOf (types.listOf types.str));
                        apply = attrs: if attrs == { } then discoverAspects config.source config.import-tree else attrs;
                      };
                      import-tree = mkOption {
                        description = "${name} import-tree";
                        type = types.unspecified;
                        default = inputs.import-tree; # empty
                        apply = tree: lib.pipe tree (default-pipeline ++ config.pipeline);
                      };
                    };
                  }
                )
              );
            };
            source = mkOption {
              type = types.unspecified;
              description = "Repository source for ${name}";
              default = sources.${name};
              readOnly = true;
              internal = true;
            };
            community-dir = mkOption {
              type = types.str;
              description = "repo community subdir";
              default = community-dir;
            };
          };
        }
      )
    );
  };
in
{
  options.flake.community = communityOption;
  config.flake.community = builtins.mapAttrs (_: _: { }) sources;
}
