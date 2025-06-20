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
        ];
      };
    };
}
