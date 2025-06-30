# A pipe line for configuring an import-tree with
# dendrix community conventions, filters and API.
# > See import-tree API for reference.
#
# this is used by options.nix when creating an
# import-tree for each community.<repo>.trees.<name>
#
# By default, paths containing `private` are filtered out
# from all community import-trees.
#
# There's also an import-tree method for people who
# choose to only share files having a `community` path.
#
# Flags are a simple way of marking files by the
# capabilities they use, and still independent
# of their location in an import-tree.
#
# Flags can be present anywhere in a path and
# they consist of a plus-sign and a name: `+lsp`.
# Negation `-lsp` means: filter out files with `+lsp`.
#
# The meaning of each flag is free and conventions might
# arise as people find them useful across repositories.
#
# NOTE: flags are automatically discovered
# from files on each community import-tree.
# and documented on Dendrix README automatically.
#
lib:
let
  pipe-line = [
    skip-private # by default ignore private paths.
    (i: i.withLib lib)
    (i: i.addAPI api)
  ];

  api = {
    inherit
      community
      flagged
      availableFlags
      ;
  };

  # anything having private on its path is ignored.
  skip-private = self: self.filterNot (lib.hasInfix "private");

  # for those only sharing things with community path.
  community = self: self.filter (lib.hasInfix "community");

  # discover +flag from files on a tree
  availableFlags =
    self:
    lib.pipe self [
      (i: i.withLib lib)
      (i: i.leafs.result)
      (builtins.map (builtins.split "\\+([[:alpha:]-]+)"))
      (builtins.map (builtins.filter builtins.isList))
      (lib.flatten)
      (lib.unique)
    ];

  # selects files flagged with flags.
  # `flags` can be an string of "+flag -flag" or a list of them.
  #
  # negative `-flag` is interpreted as exclude `+flag` files.
  #
  # strings not prefixed with +/- are interpreted as (filter hasInfix).
  flagged =
    self: flags:
    let
      flags-pipe = lib.pipe flags [
        (lib.flatten)
        (lib.map (lib.splitString " "))
        (lib.flatten)
        (lib.filter isNonEmpty)
        (lib.map (
          flag:
          if isNegative flag then
            self: self.filterNot (lib.hasInfix ("+" + (lib.removePrefix "-" flag)))
          else
            self: self.filter (lib.hasInfix flag)
        ))
      ];
      isNonEmpty = s: builtins.stringLength s > 0;
      isNegative = lib.hasPrefix "-";
    in
    lib.pipe self flags-pipe;

in
pipe-line
