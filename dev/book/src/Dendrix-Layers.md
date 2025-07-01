# Dendrix layers

[Layers](https://github.com/vic/dendrix/tree/main/dev/layers) are cross-repository flake-parts modules that provide community-managed
facilities by importing from different [`community import-trees`](https://github.com/vic/dendrix/tree/main/dev/community/discovered).

> In the future, Layers can allow to provide custom batteries-included specialized NixOS distributions.
> Like, NixOS for Gaming, NixOS for AI, NixOS for DevSec Ops, etc.

## Using Existing Layers

Layers are usable by anyone who uses flake-parts, you just need to import the corresponding module.

If you were to use the example AI layer (from below), you'd do the following on a flake module of yours:

```nix
# your ./modules/ai.nix
{ inputs, ...}:
{
   imports = [ inputs.dendrix.ai ];
}
```

## Creating Layers

A Dendrix Layer is defined at `./dev/layers/<name>/modules/**.nix`. If you create one, make sure you
also provide a `./dev/layers/<name>/README.md` with details about usage or input requirements.

For example, if the community comes up with an `ai` aspect shared across different repos, we
could have a _blessed_ ai layer providing files from both repos and community-managed configurations.

```nix
# This is an example of how an AI Layer might be defined in our Dendrix community repository.
#
# ./dev/layers/ai/modules/default.nix
{ inputs, lib, ... }:
let
  ai-one = inputs.dendrix.repo-one.ai; # import-tree for AI aspect from repo-one.
  ai-two = inputs.dendrix.repo-two.ai; # import-tree for AI aspect from repo-two.
in
{
  imports = [ ai-one ai-two ];

  # flake-level community options.
  options.ai.something.enable = lib.mkEnableOption "Enable something for AI";

  # packages,checks,devshells,etc for AI
  perSystem = {pkgs, ...}: {
    packages.ai-cli = { };
  };

  # extensions to the ai aspect.
  flake.modules.nixos.ai = { };
  flake.modules.darwin.ai = { };
  flake.modules.homeManager.ai = { };
}
```

For this to be possible we first need to collaborate around configuring the `ai` feature
in `repo-one` and `repo-two` so that their configurations do not depend on host/user specifics.

This is quite possible, because repos are free to share only part of their trees with the community.
Keeping the non-shared parts for their private infra customization.

```shell
# only this is shared to the community
./modules/community/ai.nix

# these two are not community shared.
./modules/hosts/myhost/ai.nix # augmented for host specific gpu.
./modules/users/vic/ai.nix    # with user specific credentials.
```
