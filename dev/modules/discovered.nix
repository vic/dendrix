{ config, lib, ... }:
{
  dendrix.discover-community-aspects = lib.mkDefault (builtins.getEnv "DISCOVER_ASPECTS" != "");

  perSystem =
    { pkgs, ... }:
    let
      discoveredPath = "dev/community/discovered";
      discoverCmd = {
        name = "discover";
        help = "generate files with discovery-community-aspects enabled.";
        command = "env DISCOVER_ASPECTS=true genfiles --impure \"$@\"";
      };

      imports = [
        layersNix
        elmFlag
        treesJson
      ] ++ generatedTrees;

      layersNix = lib.pipe config.dendrix.layers [
        (lib.attrNames)
        (lib.map (
          name: "# inputs.dendrix.${name} # see https://github.com/vic/dendrix/tree/main/dev/layers/${name}"
        ))
        (
          codes:
          let
            path_ = "templates/default/modules/layers.nix";
          in
          {
            treefmt.settings.formatter.deadnix.excludes = [ path_ ];
            treefmt.settings.formatter.nixf-diagnose.excludes = [ path_ ];
            files.files = [
              {
                inherit path_;
                drv = pkgs.writers.writeText "repos.js" ''
                  { inputs, ... }:
                  {
                    imports = [
                  ${lib.concatMapStrings (x: "    " + x + "\n") codes}
                    ];
                  }
                '';
              }
            ];
          }
        )
      ];

      generatedTrees = lib.pipe config.dendrix.community [
        (lib.mapAttrsToList (repo-name: repo: lib.mapAttrsToList (treeMod repo-name) repo.trees))
        (lib.flatten)
      ];

      treeMod =
        repo-name: tree-name: tree:
        let
          name = "${repo-name}/${tree-name}.json";
          path_ = "${discoveredPath}/${name}";
        in
        {
          files.files = [
            {
              inherit path_;
              drv = pkgs.writers.writeJSON name tree.aspects;
            }
          ];
        };

      treesJson =
        let
          path_ = "${discoveredPath}/trees.json";
          json = lib.pipe config.dendrix.community [
            (lib.mapAttrs (_: (repo: lib.attrNames repo.trees)))
          ];
        in
        {
          files.files = [
            {
              inherit path_;
              drv = pkgs.writers.writeJSON "trees.json" json;
            }
          ];
        };

      elmTree = tree-name: tree: {
        name = tree-name;
        aspects = lib.pipe tree.aspects [
          (lib.mapAttrsToList (
            aspect:
            lib.mapAttrsToList (
              class: files: {
                inherit aspect class files;
              }
            )
          ))
          (lib.flatten)
        ];
      };

      elmFlag = lib.pipe config.dendrix.community [
        (lib.mapAttrsToList (
          repo-name: repo: {
            name = repo-name;
            url = repo.source.url;
            trees = lib.mapAttrsToList elmTree repo.trees;
          }
        ))
        (repositories: { inherit repositories; })
        (
          json:
          let
            path_ = "dev/book/theme/dendrix_repos.js";
            uncompressed = pkgs.writers.writeText "repos.js" ";(function() { window.dendrix_repos = (${builtins.toJSON json}); })();";
            compressed = pkgs.stdenvNoCC.mkDerivation {
              name = "dendrix_repos.js";
              buildInputs = [ pkgs.uglify-js ];
              phases = [ "uglify" ];
              uglify = ''
                uglifyjs --compress --mangle --output $out ${uncompressed} 
              '';
            };
          in
          {
            files.files = [
              {
                inherit path_;
                drv = pkgs.writers.writeText "repos.js" (builtins.readFile compressed);
              }
            ];

            treefmt.settings.global.excludes = [ path_ ];
          }
        )
      ];

    in
    {
      inherit imports;
      devshells.default.commands = [ discoverCmd ];
    };

}
