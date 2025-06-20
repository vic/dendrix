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

  createSubTree =
    repo-cfg: tree-cfg:
    lib.pipe inputs.import-tree (
      [
        (self: self.addPath "${repo-cfg.source}/${tree-cfg.subdir}")
      ]
      ++ (default-pipeline tree-cfg.aspects)
      ++ tree-cfg.pipeline
    );

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
        in
        {
          options = {
            readme = mkOption {
              description = "Notes about using ${name} shared modules.";
              default = "No community notes on ${name}. Use the source, Luke.";
              type = types.str;
            };
            required-inputs = mkOption {
              description = "inputs required from ${repo-name} flake.";
              default = [ ];
              type = types.listOf types.str;
            };
            trees = mkOption {
              description = "import-tree's of shared modules";
              default = {
                default.subdir =
                  if builtins.pathExists "${sources.${name}}/modules/community" then
                    "modules/community"
                  else
                    "modules";
              };
              type = types.lazyAttrsOf (
                types.submodule (
                  { name, config, ... }:
                  {
                    options = {
                      subdir = mkOption {
                        description = "Path of ${name} subtree";
                        type = types.str;
                        default = "modules";
                      };
                      readme = mkOption {
                        description = "Notes about ${name} subtree";
                        default = "${repo-name}'s ./${config.subdir} tree";
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
                        description = "Cached aspects";
                        default = builtins.fromJSON (builtins.readFile ./discovered/${"${repo-name}/aspects/${name}.json"});
                        readOnly = true;
                        type = types.listOf (types.attrsOf types.str);
                      };
                      discover-aspects = mkOption {
                        description = "Runtime discovery of aspects. This will download sources and inputs.";
                        default = discoverAspects repo-name repo-cfg.source name config.import-tree;
                        readOnly = true;
                        type = types.attrsOf (types.attrsOf (types.listOf types.str));
                      };
                      import-tree = mkOption {
                        description = "${name} import-tree";
                        type = types.unspecified;
                        default = createSubTree repo-cfg config;
                      };
                      required-inputs = mkOption {
                        description = "inputs required from ${repo-name} flake.";
                        default = [ ];
                        type = types.listOf types.str;
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
