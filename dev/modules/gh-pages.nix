let
  name = "gh-pages.yaml";
  path_ = ".github/workflows/${name}";
in
{
  perSystem =
    { pkgs, ... }:
    {
      files.files = [
        {
          inherit path_;
          drv = pkgs.writers.writeJSON name {
            name = "gh-pages";
            on = {
              push.branches = [ "main" ];
              push.paths = [
                "dev/book/**"
                "dev/elm/**"
                "dev/npins/**"
              ];
              workflow_call = { };
              workflow_dispatch = { };
            };
            permissions = {
              contents = "read";
              pages = "write";
              id-token = "write";
            };
            concurrency = {
              group = "pages";
              cancel-in-progress = true;
            };
            jobs.deploy = {
              environment.name = "github-pages";
              environment.url = "\${{steps.deployment.outputs.page_url}}";
              runs-on = "ubuntu-latest";
              steps = (import ./_gh-provision-nix.nix) ++ [
                {
                  name = "flake check";
                  run = "nix flake --accept-flake-config check path:dev --override-input dendrix . --print-build-logs";
                }
                {
                  name = "gen book";
                  run = "nix run nixpkgs#mdbook -- build dev/book";
                }
                { uses = "actions/configure-pages@v5"; }
                {
                  uses = "actions/upload-pages-artifact@v3";
                  "with" = {
                    path = "./dev/book/book";
                  };
                }
                {
                  id = "deployment";
                  uses = "actions/deploy-pages@v4";
                }
              ];
            };
          };
        }
      ];
      treefmt.settings.global.excludes = [
        path_
        "dev/book/book/**"
        "dev/book/.gitignore"
        "dev/book/book.toml"
        "dev/book/theme/index.hbs"
        "dev/book/theme/catppuccin.css"
      ];
    };
}
