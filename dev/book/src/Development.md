# Development

We recommend to use `direnv` or simply run `nix develop ./dev` to load the env.
If you are using direnv, we provide an `.envrc` for it.

Upon entering the shell, you will see a menu of useful commands:

```shell
$ nix develop ./dev
🔨 Welcome to devshell

[[general commands]]

  book         - serve dev/book
  check        - run flake checks
  discover     - generate files with discovery-community-aspects enabled.
  elm-build    - compile elm debug mode
  elm-check    - run elm tests
  elm-registry - use elm2nix to regen dependencies registry for nix
  files        - fmt / genfiles / fmt
  fmt          - run code formatter
  genfiles     - generate files from sources
  menu         - prints this menu
  pins         - run npins inside dev
```
