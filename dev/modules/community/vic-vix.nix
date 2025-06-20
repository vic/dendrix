{

  flake.community.vic-vix =
    { ... }:
    {
      trees = {
        default.subdir = "modules/community";
        default.pipeline = [
          (
            import-tree:
            import-tree.addAPI {
              macos = self: self.flagged "macos";
            }
          )
        ];

        # this is private but exposed by vic anyways as an example.
        vic.subdir = "modules/vic";
      };
    };

}
