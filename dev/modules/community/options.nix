{
  inputs,
  lib,
  config,
  ...
}:
let
  inherit (lib) mkOption types;

  sources = import ./../../npins;
  discoverAspects = import ./../../lib/discover.nix { inherit lib inputs; };
  default-pipeline = import ./_pipeline.nix lib;
  create-import-tree = paths: lib.pipe (inputs.import-tree.addPath paths) default-pipeline;
  dendrix = config.dendrix;

  cached-trees = lib.pipe ./discovered/trees.json [
    builtins.readFile
    builtins.fromJSON
    (lib.mapAttrs (
      repo-name: tree-names:
      lib.pipe tree-names [
        (lib.map (
          tree-name:
          let
            cached-aspects = lib.pipe ./discovered/${repo-name}/${tree-name}.json [
              builtins.readFile
              builtins.fromJSON
            ];
            all-files = lib.mapAttrsToList (_: lib.attrValues) cached-aspects;
          in
          {
            ${tree-name} = {
              import-tree = create-import-tree all-files;
              aspects = cached-aspects;
            };
          }
        ))
        lib.mergeAttrsList
      ]
    ))
  ];

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

          trees = if dendrix.discover-community-aspects then discovered-trees else cached-trees.${repo-name};

          discovered-aspects = discoverAspects repo-cfg.source (create-import-tree repo-cfg.community-paths);
          discovered-trees = lib.pipe discovered-aspects [
            (lib.mapAttrs (
              aspect: classes: {
                import-tree = create-import-tree (lib.attrValues classes);
                aspects = {
                  ${aspect} = classes;
                };
              }
            ))
          ];

          community-dir =
            if builtins.pathExists "${repo-cfg.source}/modules/community" then
              "${repo-cfg.source}/modules/community"
            else
              "${repo-cfg.source}/modules";
        in
        {
          config = {
            inherit trees;
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
                        internal = true;
                        type = types.attrsOf (types.attrsOf (types.listOf types.str));
                        apply =
                          attrs:
                          if attrs == { } && dendrix.discover-community-aspects then
                            discoverAspects config.source config.import-tree
                          else
                            attrs;
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
            community-paths = mkOption {
              type = types.unspecified;
              description = "any inport-tree argument representing shared tree";
              default = [ community-dir ];
            };
          };
        }
      )
    );
  };
in
{
  options.dendrix.discover-community-aspects = lib.mkEnableOption "should we discover aspects from flakes.";
  options.dendrix.community = communityOption;
  config.dendrix.community = builtins.mapAttrs (_: _: { }) sources;
}
