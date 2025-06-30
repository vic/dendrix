{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];
  perSystem =
    { self', ... }:
    {
      treefmt = {
        projectRoot = inputs.dendrix;
        programs = {
          nixfmt.enable = true;
          deadnix.enable = true;
          nixf-diagnose.enable = true;
          prettier.enable = true;
        };
        settings.on-unmatched = "fatal";
        settings.global.excludes = [
          "LICENSE"
        ];
      };

      packages.fmt = self'.formatter;

      devshells.default.commands = [
        {
          name = "fmt";
          help = "run code formatter";
          command = "nix run path:dev#fmt";
        }
      ];

    };

}
