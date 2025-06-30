# Dendrix import-trees

Our last section ended with the following mission statement:

> This is the goal of the Dendrix project: To allow people share dendritic configurations and
> socially enhance their capabilities.

As a first step into this goal, Dendrix [discovers](https://github.com/vic/dendrix/blob/main/dev/lib/discover.nix) what `aspect`s and which nix configuration `class`es are provided by the dendritic [community repository sources](https://github.com/vic/dennix/blob/main/dev/npins/sources.json).

The sidebar on the left shows a filtering UI that serves three purposes:

- Document which aspects/classes are found on each repo and their locations.
- Visibility on what names are used by the community for defining aspects/classes.
- Allow people to re-use existing aspects by providing import-trees [to them](https://github.com/vic/dendrix/tree/main/dev/community/discovered).

## Using Community import-trees

For each [community repository](https://github.com/vic/dendrix/tree/main/dev/community/discovered),
Dendrix exposes a _top-level_ import-tree that provides all files in the repo shared paths.
And for each discovered aspect in the repo, Dendrix defines another import-tree inside repo attribute.

```nix
# your ./modules/something.nix
{inputs, ...}:
{
  imports = [
    inputs.dendrix.some-repo # ALL shared files in a repository. intended to be used WITH `.filter`.
    inputs.dendrix.some-repo.some-aspect # Files that define flake.modules.<class>.some-aspect
  ];
}
```

An example of a repo's import-tree is [`dendrix.vic-vix`](https://github.com/vic/dendrix/tree/main/dev/community/discovered/vic-vix).
It references all files shared by [vic's `modules/community`](https://github.com/vic/vix/tree/main/modules/community) directory,
except for those having the `private` infix (see [conventions](Dendrix-Conventions.html)).

An example of an repo's aspect import-tree is [`dendrix.vic-vix.macos-keys`](https://github.com/vic/dendrix/blob/main/dev/community/discovered/vic-vix/macos-keys.json) that provides MacOS like keys on Linux using `keyd`.

## Community Participation.

### Sharing re-usable parts of your Dendritic configs.

You are free to send a PR adding/removing your dendritic repo into `dev/npins/sources.json`.

If you have an uncommon directory layout, or you want to share custom import-trees, you can specify [specific community `paths`](https://github.com/vic/dendrix/blob/main/dev/community/vic-vix.nix). (see all [options](https://github.com/vic/dendrix/blob/main/dev/community/options.nix))

As an example in the previous link, vic has a `modules/community` subdir, indicating that
everything outside of it might not be ready for re-use by other people. perhaps because it depends on some hardware or
host-specifc or user-specific settings.

### Organizing with other people around aspects.

The better we organize and name our files around aspects, the better it will be to discover their intent and re-usability.

It is our hope that using the UI at the left, we can discover how are community members naming our aspects
or organizing our files, and we can participate in community discussions around aspect's naming conventions.
