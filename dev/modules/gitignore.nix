{ lib, config, ... }:
{
  options.gitignore = lib.mkOption {
    type = lib.types.lines;
    apply =
      text:
      lib.pipe text [
        (lib.splitString "\n")
        lib.naturalSort
        (lib.concatStringsSep "\n")
      ];
  };
  config = {
    perSystem =
      { pkgs, ... }:
      {
        files.files = [
          {
            path_ = ".gitignore";
            drv = pkgs.writeText ".gitignore" config.gitignore;
          }
        ];
      };

    gitignore = ''
      result
      .vscode
      .direnv
    '';
  };
}
