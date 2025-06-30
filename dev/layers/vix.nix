{ config, ... }:
let
  vix = config.dendrix.community.vic-vix.import-tree;
in
{
  dendrix.layers.vix = {
    imports = [
      (vix.flagged "+mk-os")
    ];
  };
}
