{ lib, ... }:
let

  moduleType = lib.types.oneOf [
    lib.types.path
    lib.types.attrs
    (lib.types.functionTo lib.types.attrs)
  ];

  layersOption = lib.mkOption {
    description = "a flake-parts module";
    default = { };
    type = lib.types.attrsOf moduleType;
  };

in
{
  options.dendrix.layers = layersOption;
}
