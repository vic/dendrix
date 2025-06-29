{ inputs, ... }:
{

  flake.community.vic-vix =
    { config, ... }:
    {
      # custom directory where to share modules from.
      community-paths = [ "${config.source}/modules/community" ];

      trees = {
        # a custom import-tree outside of shared community modules.
        vic.import-tree = inputs.import-tree.addPath "${config.source}/modules/vic";
      };
    };

}
