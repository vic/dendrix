{

  dendrix.community.vic-vix =
    { config, ... }:
    {
      # custom directory where to share modules from.
      paths = [ "${config.source}/modules/community" ];

      trees = {
        # a custom import-tree outside of shared community modules.
        vic.paths = [ "${config.source}/modules/vic" ];
      };
    };

}
