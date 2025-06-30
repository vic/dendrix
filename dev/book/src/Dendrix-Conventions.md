# Dendrix conventions

There are some non-mandatory conventions on Dendrix. However using them can ease integration of your repo.

Some of these conventions translate as code in the [default pipe-line](https://github.com/vic/dendrix/blob/main/dev/community/_pipeline.nix) used to configure each import-tree.

## Having a `modules/community` directory.

By default, dendrix detects if the community repo has a `modules/community` directory. If so, _only_ that directory is scanned for aspects. So we recommend having such a directory.

Otherwise the `modules/` directory will be scanned and shared.

If you, however, prefer to have another structure, it is possible to define a `paths` [option](https://github.com/vic/dendrix/blob/main/dev/community/options.nix).

## Anything `private` is not shared.

Any file (even inside `modules/community`) having a `private` infix anywhere in their path is not visible to the community.

This is akin to import-tree's `_` convention used for ignoring files. However `private` paths can be loaded by your flake but
not on Dendrix import-trees.

## Flags

Flags are a convention for allowing consumers of your repo
to easily select or skip collections of files.

A flag has the following form: `+flag`. A plus-sign and a name consisting of alphanumeric characters and `-` hypen.

Some examples of flags are: `+lsp`, `+local-ai`, `+rust`.

Flags can be present anywhere on a path: directory or file names.

By using flags in your paths, it can be posible for people do
things like including/excluding some capabilities:

```nix
{
  imports = [
    # Include anything with +vim on their path.
    # Exclude anything with +emacs on their path.
    (inputs.dendrix.your-repo.flagged "-emacs +vim")
  ];
}
```

## A clean `flake.nix` that just `import-tree ./modules`

As noted in the [focused flake.nix](Dendritic.html#minimal-and-focused-flakenix), a best practice is to move all your nix logic into a nix file inside `./modules`.

People usually have a `./modules/flake` for this purpose.

## Using standard nix features.

At least on community intended directories. Outside of your shared directories
you can use whatever nix features you want or any custom input of yours.
However, keeping the shared code usable for most people is best for code adoption.
