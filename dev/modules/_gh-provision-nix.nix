[
  { uses = "actions/checkout@v4"; }
  {
    uses = "wimpysworld/nothing-but-nix@main";
    "with" = {
      hatchet-protocol = "holster";
    };
  }
  { uses = "cachix/install-nix-action@v31"; }
  {
    uses = "cachix/cachix-action@v16";
    "with" = {
      name = "dendrix";
      authToken = "\${{secrets.CACHIX_AUTH_TOKEN}}";
    };
  }
]
