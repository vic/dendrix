let
  name = "flake-check.yaml";
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
            name = "flake check";
            on = {
              push = { };
              workflow_call = { };
              workflow_dispatch = { };
            };
            concurrency = {
              group = "test";
              cancel-in-progress = true;
            };
            jobs.check = {
              environment.name = "check";
              environment.url = "\${{steps.check.outputs.page_url}}";
              runs-on = "ubuntu-latest";
              steps = (import ./_gh-provision-nix.nix) ++ [
                {
                  id = "check";
                  run = "nix flake --accept-flake-config check path:dev --override-input dendrix . --print-build-logs";
                }
              ];
            };
          };
        }
      ];
      treefmt.settings.global.excludes = [ path_ ];
    };
}
