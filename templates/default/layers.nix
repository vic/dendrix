{ inputs, ... }:
let
  dendrix = inputs.dendrix.modules;
in
{
  imports = [
    (inputs.import-tree ./modules) # your custom dendritic modules.

    dendrix.layers.base # like css-reset but for nixos.

    # TODO: list all dendrix exposed layers here with a funny description.

    # dendrix.vix.macos-keys-on-linux # because of muscle memory
  ];
}
