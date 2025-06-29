# Development

We recommend to use `direnv` or anything that can load our `nix develop path:dev` environment. If you are
using direnv, we provide an `.envrc` for it.

Upon entering the shell, you will see a menu of useful commands during development.

```shell
nix develop ./dev -c files # generate nix-controlled files (like this README) and format them.
nix flake check ./dev      # checks all is up-to-date, community checks, and formatting

# when adding a new repo, run npins inside of ./dev
```
