{ lib, config, ... }:
let
  README = lib.pipe ./../readme_template.md [
    builtins.readFile
    (lib.replaceString "<!--:repos:-->" repos)
    (lib.replaceString "<!--:repos-summary:-->" repos-summary)
    (lib.replaceString "<!--:cross-repos-aspects:-->" cross-repos-aspects)
    (lib.replaceString "<!--:cross-repos-aspects-summary:-->" cross-repos-aspects-summary)
  ];

  count = items: builtins.toString (lib.length items);

  repo-count = count (lib.attrNames config.flake.community);

  all-trees = lib.pipe config.flake.community [
    (lib.attrValues)
    (builtins.map (x: builtins.attrValues x.trees))
    (lib.flatten)
  ];

  on-all-trees =
    f:
    lib.pipe all-trees [
      (builtins.map f)
      (lib.flatten)
      (lib.unique)
    ];

  all-nix-files = on-all-trees (t: t.import-tree.files);
  all-flags = on-all-trees (t: t.import-tree.availableFlags);
  all-aspects = on-all-trees (t: lib.attrNames t.aspects);
  all-classes = on-all-trees (
    t:
    lib.pipe t.aspects [
      (lib.attrValues)
      (lib.map lib.attrNames)
      (lib.flatten)
      (lib.filter (n: !lib.hasInfix "ERROR" n))
    ]
  );

  repos-summary = ''

    Dendrix knows of <b>${repo-count}</b> [dendritic repositories](https://github.com/vic/dendrix/blob/main/dev/npins/sources.json).
    ${count all-trees} [import-trees](https://github.com/vic/dendrix/tree/main/dev/modules/community).
    ${count all-flags} flags.
    ${count all-aspects} aspects accross ${count all-classes} different nix configuration classes.
    ${count all-nix-files} nix configuration files.
  '';

  repos = lib.pipe config.flake.community [
    (lib.mapAttrsToList repoReadme)
    (lib.concatStringsSep "\n")
  ];

  repoHome =
    repo:
    lib.pipe repo.source.url [
      (lib.replaceString ".tar.gz" "")
      (
        if repo.source.repository.type == "Forgejo" then
          lib.replaceString "/archive/" "/src/commit/"
        else
          lib.replaceString "/archive/" "/tree/"
      )
    ];

  repoReadme =
    name: repo:
    let
      rev = builtins.substring 0 7 repo.source.revision;
      repo-aspects = lib.pipe repo.trees [
        (lib.attrValues)
        (lib.map (t: t.aspects))
        (lib.map (lib.attrNames))
        (lib.flatten)
        (lib.unique)
      ];
      repo-clases = lib.pipe repo.trees [
        (lib.attrValues)
        (lib.map (t: t.aspects))
        (lib.map (lib.attrValues))
        (lib.flatten)
        (lib.map (lib.attrNames))
        (lib.flatten)
        (lib.unique)
      ];
      repo-files = lib.pipe repo.trees [
        (lib.attrValues)
        (lib.map (t: t.import-tree.files))
        (lib.flatten)
        (lib.unique)
      ];
      repoSummary = ''
        ${name} at rev ${rev}.
        ${count (lib.attrNames repo.trees)} dendritic trees.
        <b>${count repo-aspects}</b> aspects across ${count repo-clases} nix classes.
        ${count repo-files} nix configuration files.
      '';
      definedAspects = lib.pipe repo.trees [
        (lib.attrValues)
        (lib.map (t: t.aspects))
        (lib.map (
          lib.mapAttrsToList (
            aspect: classes: ''
              - <code>${aspect}</code>: ${
                lib.concatStringsSep "/" (lib.map (s: "<code>" + s + "</code>") (lib.attrNames classes))
              }
            ''
          )
        ))
        (lib.flatten)
        (lib.concatStringsSep "\n")
      ];
      text = ''
        ### [${name}](${repoHome repo}

        <details>
        <summary>

        ${repoSummary}
        </summary>

        [README](${repoHome repo}/README.md)

        <details>
        <summary>

        ##### ${name} defines <b>${count repo-aspects}</b> aspects across ${count repo-clases} nix classes.

        </summary>

        ${definedAspects}
        </details>

        ${repo.readme}

        ${lib.concatStringsSep "\n" (lib.mapAttrsToList (repoTree name repo) repo.trees)}
        </details>
      '';
    in
    text;

  repoTree =
    repoName: _repo: name: tree:
    let
      text = ''
        - ${name}:

        ${tree.readme}

        ```nix
        # usage on your layers.nix
        {inputs, ...}: {
          imports = [
            inputs.dendrix.community.${repoName}.${name}
          ];
        }
        ```
      '';
    in
    text;

  cross-repos-aspects-summary = "TODO";

  cross-repos-aspects = "TODO";

in
{
  perSystem =
    { pkgs, ... }:
    {
      files.files = [
        {
          path_ = "README.md";
          drv = pkgs.writeText "README.md" README;
        }
      ];

      treefmt.settings.global.excludes = [ "dev/book/*" ];
    };
}
