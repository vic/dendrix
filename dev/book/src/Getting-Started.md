# Getting Started

## Usage (for existing flake-parts setups)

Add the `dendrix` input to your flake:

```nix
# flake.nix -- add the dendrix input:
{
  inputs.dendrix.url = "github:vic/dendrix";

  # Flatten dependencies.
  #inputs.dendrix.inputs.import-tree.follows = "import-tree";
  #inputs.dendrix.inputs.nixpkgs-lib.follows = "nixpkgs-lib";
}
```

Then import Dendrix trees/layers on any flake-parts module of yours:

```nix
{ inputs, ... }:
{
  imports = [
    # inputs.dendrix.vic-vix.macos-keys # example <macos-keys> aspect.
    # inputs.dendrix.vix # example layer, see https://github.com/vic/dendrix/tree/main/dev/layers
  ];
}
```

See usage instructions for either [Dendrix Trees](Dendrix-Trees.html#using-community-import-trees) or [Dendrix Layers](Dendrix-Layers.html#using-existing-layers).

## Quick Start (for NixOS newcomers)

> Dendrix is a work in progress. We aim to provide batteries-included preconfigured NixOS experience for newcomers.
> But we are currently working on it.

We provide some [templates](https://github.com/vic/dendrix/tree/main/templates) you can
use to start a new system flake.

```
nix flake init github:vic/dendrix#template
```

Then edit your [`layers.nix`](https://github.com/vic/dendrix/tree/main/templates/default/modules/layers.nix) file.

### Try it Online!

If you are not currently a NixOS user, you can try
running an ephemeral NixOS on the web.

- Go to [Distrosea NixOS](https://distrosea.com/select/nixos/), select latest `minimal` release.
- Start a machine and run the following:

```shell
nix run .#os-switch template
```

## Customization

Once you have a `./modules/` directory on your flake, just add flake-parts modules following the dendritic pattern.
All files will be loaded automatically. Edit your `layers.nix` to include dendrix provided aspects you choose.
