{ ... }:
{
  config.perSystem =
    { ... }:
    {
      devshells.default.commands = [
        {
          name = "check";
          help = "run flake checks";
          command = "nix flake check path:dev --override-input dendrix . \"$@\"";
        }
      ];

    };

}
