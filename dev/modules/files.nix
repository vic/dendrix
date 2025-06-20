{ inputs, ... }:
{
  imports = [
    inputs.files.flakeModules.default
  ];

  perSystem =
    { config, ... }:
    {
      files.gitToplevel = inputs.dendrix;
      packages.genfiles = config.files.writer.drv;
      devshells.default.commands = [
        {
          name = "genfiles";
          help = "generate files from sources";
          command = "nix run path:dev#genfiles \"$@\"";
        }

        {
          name = "files";
          help = "fmt / genfiles / fmt";
          command = "fmt && genfiles \"$@\" && fmt";
        }
      ];
    };
}
