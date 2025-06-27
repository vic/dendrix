{ inputs, ... }:
{
  imports = [ inputs.devshell.flakeModule ];
  perSystem =
    { pkgs, ... }:
    {
      devshells.default = {
        packages = [
          pkgs.direnv
        ];
        commands = [
          {
            name = "pins";
            help = "run npins inside dev";
            command = "(cd dev; ${pkgs.npins}/bin/npins \"$@\" )";
          }
          {
            name = "book";
            help = "serve dev/book";
            command = "elm-check && elm-build && ${pkgs.mdbook}/bin/mdbook serve dev/book";
          }
        ];
      };
    };
}
