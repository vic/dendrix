<!-- NOTICE: edit this file at dev/readme_template.md and then run the `files` devshell command. -->

# Dendrix - community-driven distribution of Dendritic Nix configurations.

Editor-distributions like those for nvim/emacs provide community-driven,
opinionated configurations that can be easily reused and enabled by newcomers.

The `dendrix` project aims to provide the same experience: having community-managed, high-quality and no-barrier-of-entry setups for everything that can be configured using [flake-parts modules](https://flake.parts/options/flake-parts-modules.html).

Read more on [Motivation](#motivation) and [How it works](#how-it-works).

## Available dendritic repos.

The following is a list of known dendritic repositories from the nix community.
If you want to add/remove one of them, send a pull-request that edits `dev/npins/sources.json`.
Also if you want to provide custom trees, send a pull-request editing `dev/modules/community/your_repo.nix`.

<details>
<summary>
<!--:repos-summary:-->
</summary>

<!--:repos:-->
</details>

## Cross-repository Dendritic Aspects.

A primary advantage of the nix dendritic pattern are aspects (aka. cross-cutting concerns).
If you browse the list of available repos above, you can see the aspects that each repo defines as [discovered](https://github.com/vic/dendrix/blob/main/dev/lib/discover-aspects.nix) by Dendrix.

<details>
<summary>

> Aspects are just the flake outputs: `flake.modules.<class>.<name>`.

</summary>

For example, some people have `flake.modules.nixos.virtualization` and `flake.modules.darwin.virtualization` and `flake.modules.homeManager.virtualization`.

Here, `virtualization` is the aspect name, and `nixos`/`darwin`/`homeManager` are the nix configuration classes across which the `virtualization` aspect is configured.

```nix
# virtualization.nix
{
  flake.modules.nixos.virtualization = { ... };
  flake.modules.darwin.virtualization = { ... };
  flake.modules.homeManager.virtualization = { ... };
}
```

This is the reason we say that Dendritic setups are aspect-oriented: they configure cross-cutting concerns across different module types.

</details>

The following is a list of aspects that are common in more than a single repository.
Our hope is that people can collaborate to find naming conventions for common aspects.
Having that we could mix configurations from different sources to enhance the same aspect.

<details>
<summary>
<!--:cross-repos-aspects-summary:-->
</summary>

<!--:cross-repos-aspects:-->

</details>

## Flags

> Flags are a [dendrix convention](https://github.com/vic/dendrix/blob/main/dev/modules/community/_pipeline.nix)
> used as part of a file or directory name as named signals.
> Flags only exist in positive form: `+flag`. A negative `-flag` means: ignore positive `+flag` files.

For example, if you have `ai+local.nix` and `ai+cloud.nix` files.
The aspect configured by these files is most likely `ai` but the `local` and `cloud` flags signal the vendor.

Flags are inspired by editor configurations, like doomemacs: `(scala +lsp)`.
And are used in Dendrix only as a way to filter files on community import-trees.
For example, one could exclude all `+emacs` paths like `tree.flagged "-emacs +vim"`.

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

## Motivation

<details>

<summary>

_:: long but worth read on config organization and sharing ::_

> tl;dr. Because even if we already have our nix infra configs accessible to the public,
> sometimes it's not that easy for newcomers to know what to pick from them.
> Small steps of courtesy can have a big and positive impact in our community.
> Having an [import-tree](https://github.com/vic/import-tree) reference to [your repository](https://github.com/vic/dendrix/blob/main/dev/npins/sources.json) imposes no cost to you, and yet if you [help document your subtrees or refine them](https://github.com/vic/dendrix/blob/main/dev/modules/community/vic-vix.nix), that helps the community even more. Your files are always in your control and you are free to accept pull-requests for your shared aspects, staying true to the sharing-spirit of opensource.

</summary>

One cool advantage of the [dendritic](https://github.com/mightyiam/dendritic) pattern is that _every single file_ has the same `.nix` syntax, but also the same meaning. Unlike other configuration setups where nix files can be anything: nixos, darwin, packages or home configurations. In a dendritic setup each `.nix` file has only one interpretation: a flake-module. As such, it will internally [configure many different nix config classes](https://discourse.nixos.org/t/how-do-you-structure-your-nixos-configs/65851/8).

> This property enables _aspect-closures_ to be possible. Everything that is needed for a aspect to work is closely related in the same unit (file/directory), instead of being dispersed.

Imagine a single `A_aspect.nix` file. Being itself a flake-module, it can internally configure modules for `nixos`, `darwin`, `homeManager` or any other configuration class that needs to be affected for `aspect-a` to work seamlesly.

> Another unlocked property is _incremental-aspects_. Many different files can incrementally contribute to the same aspect, removing nix files or adding more do not break existing aspects, but only extend or limit its capabilites.

Now imagine two files: `A_aspect/minimal.nix`, `A_aspect/maximal.nix`. In a dendritic setup, nor filename nor location is significant, and thus, both files can contribute to the same modules that constitute `aspect-a`, but each file is focused on different capabilities.

Using the import-tree API one could select only minimal
capabilities.

```nix
shared-tree = import-tree.filter (lib.hasInfix "minimal");
```

We could also have `A_aspect/private.nix` making it contribute capabilities to our personal infra but not visible for community members.

```nix
shared-tree = import-tree.filterNot (lib.hasInfix "private");
```

We can also have a convention of anything inside `community` be shareable.

```nix
shared-tree = import-tree.filter (lib.hasInfix "community");
```

> And even provide a richer [import-tree API](https://github.com/vic/import-tree) for people
> willing to consume our shared configuration tree:

```nix
# provider's flake
flake.lib.shared-tree = lib.pipe inputs.import-tree [
  (self: self.addPath ./modules)
  (self: self.filterNot lib.hasInfix("private"))
  (self: self.filter lib.hasInfix("community"))
  (self: self.addAPI {
    aspect-a = self: self.filter lib.hasInfix("A_aspect");
    aspect-b = self: self.filter lib.hasInfix("B_aspect");
    minimal = self: self.filter lib.hasInfix("minimal");
    maximal = self: self.filter lib.hasInfix("maximal");
  })
];
```

This way people consuming our shared import-tree will not
have access to anything including `private` and only things under `community` and a couple of `minimal`, and `maximal` capability selectors.

```nix
# consumer's flake
imports = [
  inputs.providers-flake.lib.shared-tree.minimal.aspect-a
  inputs.providers-flake.lib.shared-tree.maximal.aspect-b
];
```

Of course this is only an example API. People and the community can comeup with better conventions on how to name things that better suit their design.

</details>

## How it works

<details>

<summary>

> tl;dr. By sharing subsets of community's flake-modules on this repo.

`dendrix` provides collections of [`import-tree`](https://github.com/vic/import-tree)s from [many dendritic nix repositories](https://github.com/vic/dendrix/blob/main/dev/npins/sources.json) made available by the nix community. You can think of each import-tree like a pointer into a repository's [subdir and filters](https://github.com/vic/dendrix/tree/main/dev/modules/community) to select files within.

This section outlines [some conventions](https://github.com/vic/dendrix/tree/main/dev/modules/community/_pipeline.nix) for people willing to opt-in on sharing substrees of their dendritic configs.

</summary>

In a sense, this repository is akin to [nix-community/NUR](https://github.com/nix-community/NUR)
but for flake-parts modules that can provide packages and aspects to many different nix configuration classes.

Many dendritic repositories have a `./modules` directory from where they `import-tree` all of their nix modules. However the dendritic pattern does not impose any naming convention, it just happens most of us have used `./modules`. If you have an uncommon modules path, you can set the [`trees.default.subdir`](https://github.com/vic/dendrix/blob/main/dev/modules/community/options.nix#L59) option for your-repo ([example](https://github.com/vic/dendrix/blob/main/dev/modules/community/vic-vix.nix)).

You can also use the [`import-tree API`](https://github.com/vic/import-tree) to provide refined subtrees or file filters for specific collections.

A dendrix [default convention](https://github.com/vic/dendrix/blob/main/dev/modules/community/options.nix#L16) is that any path of yours having the `private` (file or directory) is not for share.

We (as a community) still have to come up with other conventions like, how we name aspect modules. But they will araise (feel free to open an issue or discussion on this repo) as we start having _incremental aspects_ across repositories.

Based on these community import-trees we also provide some _blessed_, configuration [layers](https://github.com/vic/dendrix/tree/main/modules/layers) maintained by the Dendrix community that people can easily enable on their own dendritic setup.

</details>

## FAQ

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
  about contributing on `dev/npins/sources.json` and `dev/modules/community/*.nix`.

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

## Contributing

Since we all now have agreed to follow the Dendritic
pattern to organize our files, lets take a few more guidelines to make eveybody's life easier:

- Always be nice, and have respect for others.
- Be professional and considerate we are giving our time and energy on this project as an invaluable good for others.
- Contributions are welcome as long as you also make a compromise to become maintainer for your aspect don't abandon your contribution easily. (Unmaintained files will be removed.)
- This is a community project, so as soon as your PR is merged you'll also get commit bit, however we restrict
  changes to be only via PRs and require code-owners review before merge.
- Prefer linear git history, squash PRs and no merge-commit. Vic recommends working with jujutsu.

### Development

We recommend to use `direnv` or anything that can load our `nix develop path:dev` environment. If you are
using direnv, we provide an `.envrc` for it.

Upon entering the shell, you will see a menu of useful commands during development.

```shell
nix develop ./dev -c files # generate nix-controlled files (like this README) and format them.
nix flake check ./dev      # checks all is up-to-date, community checks, and formatting

# when adding a new repo, run npins inside of ./dev
```
