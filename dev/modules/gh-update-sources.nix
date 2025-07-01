let
  name = "update-sources.yaml";
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
            name = "update sources";
            on = {
              workflow_call = { };
              workflow_dispatch = { };
              repository_dispatch = { };
              schedule = [
                {
                  cron = "0 5 * * *";
                }
              ];
            };
            permissions = {
              contents = "write";
              pull-requests = "write";
              id-token = "write";
            };
            concurrency = {
              group = "update";
              cancel-in-progress = true;
            };
            jobs.update = {
              environment.name = "update-sources";
              environment.url = "\${{steps.update.outputs.pull-request-url}}";
              runs-on = "ubuntu-latest";
              steps = (import ./_gh-provision-nix.nix) ++ [
                {
                  run = ''
                    set -e
                    (cd dev; nix run nixpkgs#npins -- update)
                    rm -rf ./dev/community/discovered/*-*
                    export DISCOVER_ASPECTS=true
                    nix run --impure --accept-flake-config --override-input dendrix . --print-build-logs ./dev#genfiles
                    nix run --accept-flake-config --override-input dendrix . --print-build-logs ./dev#fmt
                    nix flake --accept-flake-config check path:dev --override-input dendrix . --print-build-logs
                  '';
                }
                {
                  id = "update";
                  uses = "peter-evans/create-pull-request@v7";
                  "with" = {
                    author = "Victor Borja <vborja@apache.org>";
                    commit-message = "Update sources";
                    branch = "update-sources";
                    branch-suffix = "timestamp";
                    title = "Update community sources.";
                    body = "Please review.";
                    assignees = "vic";
                  };
                }
              ];
            };
          };
        }
      ];
      treefmt.settings.global.excludes = [ path_ ];
    };
}
