[
  { uses = "actions/checkout@v4"; }
  {
    uses = "wimpysworld/nothing-but-nix@main";
    "with" = {
      hatchet-protocol = "holster";
    };
  }
  { uses = "DeterminateSystems/nix-installer-action@main"; }
  { uses = "DeterminateSystems/magic-nix-cache-action@main"; }
]
