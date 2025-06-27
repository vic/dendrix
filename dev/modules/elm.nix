let
  path_ = "dev/book/theme/elm.js";
  main = "src/Search.elm src/Results.elm";
in
{
  gitignore = "elm-stuff";
  perSystem =
    { pkgs, ... }:
    let
      elm_js = pkgs.stdenvNoCC.mkDerivation {
        name = "elm-builds";
        src = ./../elm;
        buildInputs = [
          pkgs.uglify-js
          pkgs.elmPackages.elm
        ];
        postUnpack = (
          pkgs.elmPackages.fetchElmDeps {
            elmVersion = "0.19.1";
            elmPackages = import ./../elm/elm-srcs.nix;
            registryDat = ./../elm/registry.dat;
          }
        );
        buildPhase = ''
          mkdir -p $out
          elm make --optimize --output $out/elm.js ${main}
          uglifyjs $out/elm.js --compress 'pure_funcs=[F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9],pure_getters,keep_fargs=false,unsafe_comps,unsafe' | uglifyjs --mangle --output $out/elm.min.js
        '';
      };
    in
    {
      treefmt.programs.elm-format.enable = true;
      treefmt.settings.global.excludes = [
        "dev/elm/elm-stuff/*"
        "dev/elm/registry.dat"
      ];
      files.files = [
        {
          inherit path_;
          drv = pkgs.writers.writeText "elm.js" (builtins.readFile "${elm_js}/elm.min.js");
        }
      ];
      devshells.default.packages = [ pkgs.elmPackages.elm ];
      devshells.default.commands = [
        {
          name = "elm-build";
          help = "compile elm debug mode";
          command = "cd dev/elm; elm make --debug --output ../../${path_} ${main} \"$@\" ";
        }
      ];
    };
}
