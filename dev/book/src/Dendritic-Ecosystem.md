# Dendritic Ecosystem

The following is a partial list of resources, such as guides, libraries, fameworks that can help you take your Dendritic-fu to the next level.

They are not listed in any order of preference, instead we try to group then by how they relate to each other.

You can also try [searching github](https://github.com/search?q=%28dendritic+language%3ANix%29+OR+%28dendritic+flake+language%3AMarkdown%29&type=code) to discover awesome dendritic implementations. Be sure to send a PR if you have anything valuable for the community.

## Talking to people in the community

- [mightyiam/dendritic](https://github.com/mightyiam/dendritic) repository has some ongoing [discussions](https://github.com/mightyiam/dendritic/discussions).

- [#dendritic matrix room](https://matrix.to/#/#dendritic:matrix.org)

You can also track the `#dendritic`/`#nix` hashtags on some social networks.

Even when the Dendritic pattern has no library impositions, or perhaps because of that
people have created libraries/frameworks to help then along their Dendritic journey.

Some other utilities/libraries surely exist inside personal dendritic repositories.
We also list some personal repos that you might find interesting, and perhaps they can
be of inspiration for new libraries that benefit the community as well.

## Personal Repositories - Dendritic Implementations.

- [drupol/infra](https://github.com/drupol/infra)
- [mightyiam/infra](https://github.com/mightyiam/infra)
- [vic/vix](https://github.com/vic/vix)

## Libraries

#### quasigod's Unify framework.

[quasigod/unify](https://codeberg.org/quasigod/unify/) was perhaps the first framework explicitly accomodating to the dendritic pattern. quasigod came up with the great idea of using `<aspect>.<class>` syntax. And Dendritic modules in Unify tend to look terse and very clean.

[gh code search](https://github.com/search?q=quasigod%2Funify+language%3ANix+&type=code) for examples using it.

#### vic's Dendritic libraries

vic tried for a long time not to use any libs besides `flake.parts`, however he has authored
some libraries with one mission in mind: to help people _share_ common dendritic configurations.

so, vic's focus is not only on creating dendritic configs but more importantly on having them be re-usable,
so people can have dendritic modules that can be cherry-picked and applied in different projects or by different people, without cloning/copying them each time.

the following is a list of vic's projects related to this goal and what role they play in vic's Dendrix vision.

- [vic/import-tree](https://github.com/vic/import-tree) as a way of auto-importing nix files.

  `import-tree` can be used to select only a subset of a nix repository. given that in Dendritic all files
  have the same semantic meaning (flake-parts modules), you can use import-tree API to create selections of files
  from a repo and import only those parts that you need.

- [vic/flake-file](https://github.com/vic/flake-file) as a way to have modules contribute to flake.nix.

  this means that sub-trees imported from a community of shared Dendritic modules can contribute to your flake.
  just like adding a vim plugin causes it to install lsp-servers/linters via mason.
  if you use `flake-file` in your repo, your modules become more re-usable since they also specify their inputs.

- [vic/flake-aspects](https://github.com/vic/flake-aspects) as a way to configure aspect dependencies.

  inspired by unify's `<aspect>.<class>` transposition, `flake-aspects` allows conditional/parametric and composable dependencies between any nix configuration class. the library is pretty much independent, extensible and can be mixed in existing dendritic repos incrementally.

- [vic/den](https://github.com/vic/den) extends `flake.aspects` and accomodates for host and users definitions.

  this one library is a bit more opinionated, as it establishes dependencies between host and user aspects,
  and provides `flake.aspects.default.{host,user}` definitions for global configurations.
  the `default` template provides working dendritic setups that rely on all previous libraries.

- [vic/denful](https://github.com/vic/denful) - a dendritic modules collection.

  a collection of _blessed_ dendritic modules with no user/host/hardware specifics, intended to be totally reusable.
  think of it as a vim-distribution that contains many plugins where you can choose from.
  you can import-tree any parts from `denful` and it must _just work_, since all flake-inputs are contained in modules.
  denful has flake checks trying to keep all modules stable and working at all times.

- [vic/dendrix](https://github.com/vic/dendrix) - community submitted and community maintained dendritic sub-trees.

  community dendritic modules. think of this as AUR for Dendritic Nix. there are no guarantees of things working since
  [dendrix-trees](Dendrix-Trees.html) are just references to sub-trees of people's repositores. the idea is that we can motivate people to share their modules or include other people's modules. this is very much a community effort.

- [vic/dendrite](https://github.com/vic/dendrite) - dendritic nixos distribution.

  imagine a nixos distribution where you have a CLI/UI where you can explore/fuzzy-search all nix options available on your system and just toggle them or input their value. You also have lists of dendritic import-trees you can enable from different sources, their modules will contribute new flake-inputs, thus adding new nix options you can toggle on/off. The CLI/UI acts as a kind of dendritic-nix store, enable subtrees, toggle options, have fully customized systems in a breze.
