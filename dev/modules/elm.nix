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
          pkgs.elmPackages.elm-test
        ];
        postUnpack = (
          pkgs.elmPackages.fetchElmDeps {
            elmVersion = (builtins.fromJSON (builtins.readFile ./../elm/elm.json)).elm-version;
            elmPackages = import ./../elm/elm-srcs.nix;
            registryDat = ./../elm/registry.dat;
          }
        );
        buildPhase = ''
          mkdir -p $out
          elm make --optimize --output $out/elm.js ${main}
          uglifyjs $out/elm.js --compress 'pure_funcs=[F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9],pure_getters,keep_fargs=false,unsafe_comps,unsafe' | uglifyjs --mangle --output $out/elm.min.js
        '';
        doCheck = true;
        checkPhase = ''
          elm-test
        '';
      };
    in
    {
      treefmt.programs.elm-format.enable = true;
      treefmt.settings.global.excludes = [
        path_
        "dev/elm/elm-stuff/*"
        "dev/elm/registry.dat"
      ];
      checks.elm_tests = elm_js;
      files.files = [
        {
          inherit path_;
          drv = pkgs.writers.writeText "elm.js" (builtins.readFile "${elm_js}/elm.min.js");
        }
      ];
      devshells.default.packages = [
        pkgs.elmPackages.elm
        pkgs.elmPackages.elm-test
      ];
      devshells.default.commands = [
        {
          name = "elm-build";
          help = "compile elm debug mode";
          command = "cd dev/elm; elm make --debug --output ../../${path_} ${main} \"$@\" ";
        }
        {
          name = "elm-check";
          help = "run elm tests";
          command = "cd dev/elm; ${pkgs.elmPackages.elm-test}/bin/elm-test \"$@\"";
        }
        {
          name = "elm-registry";
          help = "use elm2nix to regen dependencies registry for nix";
          command = "cd dev/elm; ${pkgs.elm2nix}/bin/elm2nix convert > elm-srcs.nix && ${pkgs.elm2nix}/bin/elm2nix snapshot";
        }
      ];
    };
}
