{ config, lib, ... }:
{

  perSystem =
    { pkgs, ... }:
    let
      imports = [ elmFlag ] ++ generatedTrees;

      generatedTrees = lib.pipe config.flake.community [
        (lib.mapAttrsToList (repo-name: repo: lib.mapAttrsToList (treeMod repo-name) repo.trees))
        (lib.flatten)
      ];

      treeMod =
        repo-name: tree-name: tree:
        let
          name = "${repo-name}/${tree-name}.json";
          path_ = "dev/modules/community/discovered/${name}";
        in
        {
          files.files = [
            {
              inherit path_;
              drv = pkgs.writers.writeJSON name tree.aspects;
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

      elmFlag = lib.pipe config.flake.community [
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
    };

}
