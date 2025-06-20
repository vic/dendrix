{ lib, config, ... }:
{
  # checks for sources
  config.perSystem =
    { pkgs, ... }:
    let
      mkCheck =
        name:
        let
          from = config.flake.community.${name};
          tree = from.trees.default.import-tree;
          leafs = (tree.withLib lib).leafs [ ];
          count = builtins.toString (builtins.length leafs);
        in
        pkgs.stdenvNoCC.mkDerivation {
          name = "check-leafs-${name}";
          phases = [ "leafs" ];
          leafs = ''
            test 0 -lt ${count}
            touch $out
          '';
        };
      checks = lib.mapAttrs' (
        name: _: lib.nameValuePair "${name}-leafs" (mkCheck name)
      ) config.flake.community;
    in
    {
      inherit checks;

      devshells.default.commands = [
        {
          name = "check";
          help = "run flake checks";
          command = "nix flake check path:dev --override-input dendrix . \"$@\"";
        }
      ];

    };

}
