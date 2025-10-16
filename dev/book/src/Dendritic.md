# Dendritic Nix

[Dendritic](https://github.com/mightyiam/dendritic) is a [pattern](https://discourse.nixos.org/t/pattern-every-file-is-a-flake-parts-module/61271) for writing nix configurations based on [flake-parts](https://flake.parts)'s [`modules` option](https://flake.parts/options/flake-parts-modules.html).

We say that Dendritic nix configurations are _aspect-oriented_, meaning that each nix file
provides config-values for the same _aspect_ across different nix configuration classes.

This is done via flake-parts' `flake.modules.<class>.<aspect>` options.

Where `<class>` is a type of configuration, like [`nixos`](https://nixos.org/manual/nixos/stable/options), [`darwin`](https://nix-darwin.github.io/nix-darwin/manual/), [`homeManager`](https://home-manager.dev/manual/23.11/options.xhtml), [`nixvim`](https://nix-community.github.io/nixvim/search/), etc.

And `<aspect>` is the _cross-cutting concern_ or _feature_ that is being configured across
one or more of these classes.

### Example of a dendritic configuration.

As an example of what a dendritic nix config looks like, suppose we want to configure ssh facilities
(the `ssh` aspect) across our NixOS, Nix-darwin hosts and user homes.

```nix
# modules/ssh.nix -- like every other file inside modules, this is a flake-parts module.
{ config, ... }: {
  flake.modules.nixos.ssh = {
    # Linux config: server, firewall-ports, etc.
  };

  flake.modules.darwin.ssh = {
    # MacOS config: enable builtin ssh server, etc.
  };

  flake.modules.homeManager.ssh = {
    # setup ~/.ssh/config or keys.
  };

  perSystem = {pkgs, ...}: {
    # expose custom package/checks/devshells by this aspect.
  };
}
```

That's it. This is what Dendritic is all about. By following this configuration pattern you
will notice your code now incorporates the following:

## Denritic Advantages

### No need to use `specialArgs` for communicating values.

A common pattern for passing values between different nix configurations types (e.g., between a `nixos` config and a `homeManager` one),
is to use the [`specialArgs`](https://nixos.org/manual/nixos/stable/options#opt-_module.args) module argument or [`home-manager.extraSpecialArgs`](https://home-manager.dev/manual/23.11/nixos-options.xhtml#nixos-opt-home-manager.extraSpecialArgs).

This is considered an _anti-pattern in dendritic setups_, since there's no need to use `specialArgs` at all. Because you can
always use let bindings (or even define your own _options_ at the flake-parts level) to share values across different configuration classes.

```nix
# modules/vic.nix -- a flake-parts module that configures the "vic" user aspect.
let
  userName = "vic"; # a shared value between classes
in
{
  flake.modules.nixos.${userName} = {
     users.users.${userName} = { isNormalUser = true; extraGroups = [ "wheel" ]; };
  };

  flake.modules.darwin.${userName} = {
     system.primaryUser = userName; # configuring a user is different on MacOS than on NixOS.
  };

  flake.modules.homeManager.${userName} =
    { pkgs, lib, ... }:
    {
      home.username = lib.mkDefault userName;
      home.homeDirectory = lib.mkDefault (if pkgs.stdenvNoCC.isDarwin then "/Users/${userName}" else "/home/${userName}");
      home.stateVersion = lib.mkDefault "25.05";
    };
}
```

### No file organization restrictions.

The dendritic pattern imposes no restrictions on how you organize or name your nix files.

Unlike other nix-configuration libs/frameworks that mandate a predefined structure. In Dendritic,
you are free to move or rename each file as it better suits your mental model.

This is possible because:

### All nix files have the same semantic meaning.

In a Dendritic setup, each `.nix` file has only one interpretation: A flake-parts module.

Unlike other kinds of setup where each nix file can be a `nixos` configuration, or a `home-manager` configuration, or
a package, or something entirely different. In such setups, loading a file requires you to know what kind of meaning
each file has before importing it.

This leads us to having:

### No manual file imports.

All files being flake-parts modules, means we have no need for manually importing nix files. They can all be
loaded at once into a single import.

The Dendritic community commonly uses [`vic/import-tree`](https://github.com/vic/import-tree) for this.
Note: import-tree ignores any file that has an `_` anywhere as part of its path.

```nix
# flake.nix
{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    # all other inputs your flake needs, like nixpkgs.
  };
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
```

This is the only place you will call `import-tree` and it will load all files under `./modules` recursively.

This means we can have:

### Minimal and focused flake.nix

Instead of having huge `flake.nix` files with lots of nix logic inside. It is now possible
to move all nix logic into well organized auto-imported flake-parts in `./modules`. This way, `flake.nix` serves more as a manifest of dependencies and flake entrypoint.

Some people go a step further and use [vic/flake-file](https://github.com/vic/flake-file) to manage their flake.nix automatically, by letting each flake-part module also define the flake inputs needed by each module.

Any flake-parts module can contribute to flake.nix as needed, either inputs/flake-configuration (by using `vic/flake-file`) or outputs (modules/packages/checks/osConfigurations/etc).

```nix
# ./modules/home/vim.nix
{ inputs, ... }:
{
  flake-file.inputs.nixvim.url = "github:nix-community/nixvim";
  flake.modules.homeManager.vim = {
    # use inputs.nixvim
  };
}
```

### Feature Centric instead of Host Centric.

As noted by Pol Dellaiera in [Flipping the Configuration Matrix](https://not-a-number.io/2025/refactoring-my-infrastructure-as-code-configurations/#flipping-the-configuration-matrix):

> the configuration is now structured around features, not hostnames. It is a shift in the axis of composition, essentially an inversion of configuration control. What may seem like a subtle change at first has profound implications for flexibility, reuse, and maintainability.

You will notice that you start naming your files around the `aspect`s (features) they define
instead of where they are applied.

### Feature _Closures_

By closure, we mean: everything that is needed for a given _feature_ to work is
configured closely, in the same unit (file/directory named after the feature).

Because a single `feature.nix` contributes to different configuration classes, it has all
the information on how feature works, instead of having to look at different files for
package definitions, nixos or home-manager configurations dispersed over all over the tree.

If you need to look where some feature is defined on a repo you don't know,
it will be easier to simply guess by path name. _Paths become documentation_.

### _Incremental_ Features

Since all nix files are loaded automatically. You can increment the capabilities that an
existing `feature-x/basic.nix` provides by just creating another `feature-x/advanced.nix`.
Both of them should contribute to the same aspect: `flake.modules.<class>.feature-x`, but
each file focuses on the different capabilities they provide to the system whole.

This way, you can split `feature-x/advanced.nix` into more files. And adding or removing
files from your modules (or adding an `_` for them to be ignored) has no
other impact than the overall capabilities provided into your systems.

This is an easy way to disable loading files while on a huge refactor. Or when some hosts
or features should be decommissioned immediately/temporarily.

### No dependencies other than flake-parts

Since the dendritic pattern builds around flake-parts modules, the only dependency is
`flake-parts`. You can load files using import-tree or any other means. You can also use
any flake-parts based library to define your configurations, like [Unify](https://codeberg.org/quasigod/unify),
as long as it exposes `flake.modules.<class>.<aspect>` attribute sets.

### Dendritic community.

Last but not least. By using the dendritic pattern you open the door to defining or re-using
existing generic (user/host independent) configurations from the community.

This is the goal of the Dendrix project: To allow people share dendritic configurations and
socially enhance their capabilities.
