# Frequently Asked Questions

- Are these configurations restriced to dendritic setups?

  Yes. The reason is that using dendritic patterns allows
  us to easily combine configs from many different community sources
  knowing that each and every .nix file will be a flake-parts module.

  Layers (blessed presets) are always loaded by import-tree,
  but _only enabled_ when you include them as part of a top-level module of yours.

- Is dendrix a NixOS based distribution ?

  In a way, but we still don't provide customized bootable installers.

  It is more a flake-parts configurations collection that can be included
  on any dendritic setup.

- Can I contribute my _awesome Desktop_ rice?

  Sure! the best way to do that is to keep your desktop rice on your own repository.
  And use this repo to add an import-tree object pointing to it. See the notes above
  about contributing on `dev/npins/sources.json` and `dev/community/*.nix`.

- How are layers made?

  A layer is a _blessed_ dendritic setup, aimed to reuse aspects from the community
  provided dendritic repositories. However these blessed configs might have conventions
  that community repositories not necessarily follow (since our repos are mainly used
  for our own infra). So it is part of this community to create discussions about how
  to name things so that best practices and conventions arise around sharing and
  extending known aspects.

  For example, if we had a `gaming` aspect. We would need conventions on how to name
  aspect modules for gaming. And people would likely provide such dendritic configurations
  on their setups.

  So, long story short, layers are community owned setups. And repos are owned by
  a respective community member.

- How about Games/AI/Devops/Security layers?

  You are right on point!, that's precisely why this project started. We also
  want to provide specialized versions of NixOS focused on pre-configured security, gaming,
  development setups.
