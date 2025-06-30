{
  inputs,
  lib,
  config,
  ...
}:
let
  inherit (lib) mkOption types;

  dendrix = config.dendrix;

  sources = import ./../npins;

  discoverAspects = import ./../lib/discover.nix { inherit lib inputs; };
  defaultPipeline = import ./_pipeline.nix lib;
  createImportTree = paths: lib.pipe (inputs.import-tree.addPath paths) defaultPipeline;

  addTreesAPI =
    trees: self:
    self.addAPI (
      lib.mapAttrs (
        _: t: _self:
        t.import-tree
      ) trees
    );

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
              paths = all-files;
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

          discovered-trees = lib.pipe repo-cfg.paths [
            createImportTree
            (discoverAspects repo-cfg.source)
            (lib.mapAttrs (
              aspect: classes: {
                paths = lib.attrValues classes;
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
            trees = mkOption {
              description = "import-tree's of shared modules";
              default = { };
              type = types.lazyAttrsOf (
                types.submodule (
                  { name, config, ... }:
                  {
                    options = {
                      pipeline = mkOption {
                        description = "An pipeline to configure ${name} import-tree";
                        type = types.listOf (types.functionTo types.unspecified);
                        default = [ ];
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
                      paths = mkOption {
                        description = "import-tree arguments";
                        default = [ ];
                        type = types.listOf types.unspecified;
                      };
                      import-tree = mkOption {
                        description = "${name} import-tree";
                        type = types.unspecified;
                        readOnly = true;
                        internal = true;
                        default = lib.pipe config.paths ([ createImportTree ] ++ config.pipeline);
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
            pipeline = mkOption {
              description = "An pipeline to configure top-level import-tree";
              type = types.listOf (types.functionTo types.unspecified);
              default = [ ];
            };
            paths = mkOption {
              type = types.listOf types.unspecified;
              description = "any inport-tree argument representing shared tree";
              default = [ community-dir ];
            };
            import-tree = mkOption {
              description = "top level import-tree";
              type = types.unspecified;
              readOnly = true;
              default = lib.pipe config.paths (
                [ createImportTree ] ++ config.pipeline ++ [ (addTreesAPI config.trees) ]
              );
            };
          };
        }
      )
    );
  };
in
{
  options.dendrix = {
    # for internal use only.
    discover-community-aspects = lib.mkEnableOption "should we discover aspects from flakes.";
    community = communityOption;
  };
  config.dendrix.community = builtins.mapAttrs (_: _: { }) sources;
}
