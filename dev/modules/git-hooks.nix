{ inputs, ... }:
{
  perSystem =
    { ... }:
    {
      devshells.default = {
        imports = [
          "${inputs.devshell}/extra/git/hooks.nix"
        ];

        git.hooks = {
          enable = true;
          pre-commit.text = "check";
        };
      };
    };
}
