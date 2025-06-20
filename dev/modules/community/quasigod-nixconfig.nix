{

  flake.community.quasigod-nixconfig =
    { ... }:
    {
      required-inputs = [ "unify" ];
      trees = {
        # quasigod's hosts is private.
        default.subdir = "modules";
      };
    };

}
