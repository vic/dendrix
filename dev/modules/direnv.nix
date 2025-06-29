let
  path_ = ".envrc";
  text = ''
    use flake path:dev
  '';

  file = pkgs: {
    inherit path_;
    drv = pkgs.writeText "direnv-envrc" text;
  };
in
{
  perSystem =
    { pkgs, ... }:
    {
      files.files = [ (file pkgs) ];
      treefmt.settings.global.excludes = [ path_ ];
    };
}
