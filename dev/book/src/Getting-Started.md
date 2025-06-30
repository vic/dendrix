# Getting Started

## Usage (for existing flake-parts setups)

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
running an ephemereal NixOS on the web.

- Go to [Distrosea nixos-unstable-minimal](https://distrosea.com/start/nixos-unstable-minimal/)

Start a machine and run the following:

```shell
nix run .#os-switch template

```

## Customization

Once you have a `./modules/` directory on your flake, just add flake-parts modules following the dendritic pattern.
All files will be loaded automatically. Edit your `layers.nix` to include dendrix provided aspects you choose.
