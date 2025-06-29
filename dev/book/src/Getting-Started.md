# Getting Started

> Dendrix is an on-going effort. While we aim at providing blessed [Layers](Dendrix-Layers.html) to ease the life of NixOS newcomers, we are not still there.

## Quick Start

We provide some [templates](https://github.com/vic/dendrix/tree/main/templates) you can
use to start a new flake.

```
nix flake init github:vic/dendrix#template
```

Then edit your [`layers.nix`](https://github.com/vic/dendrix/tree/main/templates/default/layers.nix) file.

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
