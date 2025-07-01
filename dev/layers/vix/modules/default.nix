{ inputs, ... }:
let
  vix = inputs.dendrix.vic-vix;
in
{
  imports = [
    (vix.flagged "+mk-os")
  ];
}
