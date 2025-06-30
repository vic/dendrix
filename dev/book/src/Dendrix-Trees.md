# Dendrix import-trees

Our last section ended with the following mission statement:

> This is the goal of the Dendrix project: To allow people share dendritic configurations and
> socially enhance their capabilities.

As a first step into this goal, Dendrix [discovers](https://github.com/vic/dendrix/blob/main/dev/lib/discover.nix) what `aspect`s and which nix configuration `class`es are provided by the dendritic [community repository sources](https://github.com/vic/dennix/blob/main/dev/npins/sources.json).

The sidebar on the left shows a filtering UI that serves three purposes:

- Document which aspects/classes are found on each repo and their locations.
- Visibility on what names are used by the community for defining aspects/classes.
- Allow people to re-use existing aspects by providing import-trees [to them](https://github.com/vic/dendrix/tree/main/dev/community/discovered).

## Community Participation.

### Sharing re-usable parts of your Dendritic configs.

You are free to send a PR adding/removing your dendritic repo into `dev/npins/sources.json`.

And even if you have an uncommon directory layout, you can share [specific community `paths`](https://github.com/vic/dendrix/blob/main/dev/community/vic-vix.nix).

As an example in the previous link, vic has a `modules/community` subdir, indicating that
everything outside of it might not be ready for re-use by other people. perhaps because it depends on some hardware or
host-specifc or user-specific settings.

### Organizing with other people around aspects.

The better we organize and name our files around aspects, the better it will be to discover their intent and re-usability.

It is our hope that using the UI at the left, we can discover how are community members naming our aspects
or organizing our files, and we can participate in community discussions around aspect's naming conventions.
