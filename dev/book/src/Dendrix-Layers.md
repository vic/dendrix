# Dendrix layers

> Layers are an upcoming feature of the Dendrix project.

Dendrix Layers are cross-repository import-trees that provide community-managed configurations.

For example, if the community comes up with an `ai` aspect shared across different repos, we
could have a _blessed_ layer providing both:

```nix
dendrix.layers.ai = import-tree.addPath [
   dendrix.community.repo-one.ai
   dendrix.community.repo-two.ai
];
```

For this to be possible we first need to collaborate around configuring the `ai` feature
in `repo-one` and `repo-two` so that their configurations do not depend on host/user specifics.

This is quite possible, since repo-one can do the following:

```shell
# only this is shared to the community
./modules/community/ai.nix

# these two are not community shared.
./modules/hosts/myhost/ai.nix # augmented for host specific gpu.
./modules/users/vic/ai.nix    # with user specific credentials.
```

Having Dendrix Layers will allow us to provide _opinionated_ or _batteries-included_ NixOS
specific distributions. Like NixOS for AI development, NixOS for Gaming, etc.
