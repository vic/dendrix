{

  flake.community.quasigod-nixconfig =
    { ... }:
    {
      trees = {
        # quasigod's hosts is private.
        default.subdir = "modules";
      };
    };

}
