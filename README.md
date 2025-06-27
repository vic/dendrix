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

Dendrix knows of <b>8</b> [dendritic repositories](https://github.com/vic/dendrix/blob/main/dev/npins/sources.json).
9 [import-trees](https://github.com/vic/dendrix/tree/main/dev/modules/community).
9 flags.
161 aspects accross 9 different nix configuration classes.
613 nix configuration files.

</summary>

### [Maka-77x-nixconf7](https://github.com/Maka-77x/nixconf7/tree/e3fd4cacd66d708911109b3a0f43f7b65d8be7bd/modules)

<details>
<summary>

Maka-77x-nixconf7 at rev e3fd4ca.
1 dendritic trees.
<b>22</b> aspects across 2 nix classes.
97 nix configuration files.

</summary>

[README](https://github.com/Maka-77x/nixconf7/tree/e3fd4cacd66d708911109b3a0f43f7b65d8be7bd/README.md)

<details>
<summary>

##### Maka-77x-nixconf7 defines <b>22</b> aspects across 2 nix classes.

</summary>

- <code>ai</code>: <code>nixos</code>

- <code>base</code>: <code>homeManager</code>/<code>nixos</code>

- <code>bluetooth</code>: <code>nixos</code>

- <code>desktop</code>: <code>homeManager</code>/<code>nixos</code>

- <code>dev</code>: <code>homeManager</code>/<code>nixos</code>

- <code>displaylink</code>: <code>nixos</code>

- <code>email</code>: <code>homeManager</code>

- <code>facter</code>: <code>homeManager</code>/<code>nixos</code>

- <code>fwupd</code>: <code>nixos</code>

- <code>games</code>: <code>homeManager</code>

- <code>guacamole</code>: <code>nixos</code>

- <code>hosts/gouda</code>: <code>nixos</code>

- <code>hosts/nixos</code>: <code>nixos</code>

- <code>messaging</code>: <code>homeManager</code>

- <code>mimi</code>: <code>nixos</code>

- <code>openssh</code>: <code>nixos</code>

- <code>root</code>: <code>nixos</code>

- <code>shell</code>: <code>homeManager</code>/<code>nixos</code>

- <code>sound</code>: <code>nixos</code>

- <code>virtualisation</code>: <code>nixos</code>

- <code>vpn</code>: <code>homeManager</code>/<code>nixos</code>

- <code>work</code>: <code>homeManager</code>

</details>

No community notes on Maka-77x-nixconf7. Use the source, Luke.

- default: [`modules`](https://github.com/Maka-77x/nixconf7/tree/e3fd4cacd66d708911109b3a0f43f7b65d8be7bd/modules)

Maka-77x-nixconf7's ./modules tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.default
  ];
}
```

</details>

### [dliberalesso-nix-config](https://github.com/dliberalesso/nix-config/tree/499b5a0ace8323a21e2fa28f94daafd03a7958c7/modules)

<details>
<summary>

dliberalesso-nix-config at rev 499b5a0.
1 dendritic trees.
<b>8</b> aspects across 2 nix classes.
85 nix configuration files.

</summary>

[README](https://github.com/dliberalesso/nix-config/tree/499b5a0ace8323a21e2fa28f94daafd03a7958c7/README.md)

<details>
<summary>

##### dliberalesso-nix-config defines <b>8</b> aspects across 2 nix classes.

</summary>

- <code>default</code>: <code>home</code>/<code>nixos</code>

- <code>facter</code>: <code>home</code>/<code>nixos</code>

- <code>gui</code>: <code>home</code>/<code>nixos</code>

- <code>hyprde</code>: <code>home</code>/<code>nixos</code>

- <code>irpf</code>: <code>home</code>/<code>nixos</code>

- <code>laptop</code>: <code>home</code>/<code>nixos</code>

- <code>work</code>: <code>home</code>/<code>nixos</code>

- <code>wsl</code>: <code>home</code>/<code>nixos</code>

</details>

No community notes on dliberalesso-nix-config. Use the source, Luke.

- default: [`modules`](https://github.com/dliberalesso/nix-config/tree/499b5a0ace8323a21e2fa28f94daafd03a7958c7/modules)

dliberalesso-nix-config's ./modules tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.dliberalesso-nix-config.default
  ];
}
```

</details>

### [drupol-infra](https://github.com/drupol/infra/tree/a10da3a0e88d17566918fa8db69fa0faa9e1d0c8/modules)

<details>
<summary>

drupol-infra at rev a10da3a.
1 dendritic trees.
<b>24</b> aspects across 2 nix classes.
107 nix configuration files.

</summary>

[README](https://github.com/drupol/infra/tree/a10da3a0e88d17566918fa8db69fa0faa9e1d0c8/README.md)

<details>
<summary>

##### drupol-infra defines <b>24</b> aspects across 2 nix classes.

</summary>

- <code>ai</code>: <code>nixos</code>

- <code>base</code>: <code>homeManager</code>/<code>nixos</code>

- <code>bluetooth</code>: <code>nixos</code>

- <code>desktop</code>: <code>homeManager</code>/<code>nixos</code>

- <code>dev</code>: <code>homeManager</code>/<code>nixos</code>

- <code>displaylink</code>: <code>nixos</code>

- <code>email</code>: <code>homeManager</code>

- <code>facter</code>: <code>homeManager</code>/<code>nixos</code>

- <code>fwupd</code>: <code>nixos</code>

- <code>games</code>: <code>homeManager</code>

- <code>guacamole</code>: <code>nixos</code>

- <code>hosts/nixos</code>: <code>nixos</code>

- <code>hosts/x13</code>: <code>nixos</code>

- <code>hosts/x260</code>: <code>nixos</code>

- <code>hosts/x280</code>: <code>nixos</code>

- <code>hosts/xeonixos</code>: <code>nixos</code>

- <code>messaging</code>: <code>homeManager</code>

- <code>openssh</code>: <code>nixos</code>

- <code>pol</code>: <code>nixos</code>

- <code>root</code>: <code>nixos</code>

- <code>shell</code>: <code>homeManager</code>/<code>nixos</code>

- <code>sound</code>: <code>nixos</code>

- <code>vpn</code>: <code>homeManager</code>/<code>nixos</code>

- <code>work</code>: <code>homeManager</code>

</details>

No community notes on drupol-infra. Use the source, Luke.

- default: [`modules`](https://github.com/drupol/infra/tree/a10da3a0e88d17566918fa8db69fa0faa9e1d0c8/modules)

drupol-infra's ./modules tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.default
  ];
}
```

</details>

### [gaetanlepage-nix-config](https://github.com/gaetanlepage/nix-config/tree/a17aca5073f9bc51e3660a5015b03d6513a87573/modules)

<details>
<summary>

gaetanlepage-nix-config at rev a17aca5.
1 dendritic trees.
<b>55</b> aspects across 2 nix classes.
131 nix configuration files.

</summary>

[README](https://github.com/gaetanlepage/nix-config/tree/a17aca5073f9bc51e3660a5015b03d6513a87573/README.md)

<details>
<summary>

##### gaetanlepage-nix-config defines <b>55</b> aspects across 2 nix classes.

</summary>

- <code>agenix</code>: <code>nixos</code>

- <code>android</code>: <code>nixos</code>

- <code>bg-stream</code>: <code>homeManager</code>

- <code>bluetooth</code>: <code>nixos</code>

- <code>bootloader</code>: <code>nixos</code>

- <code>caddy-reverse-proxies</code>: <code>nixos</code>

- <code>cloud-backup</code>: <code>nixos</code>

- <code>core</code>: <code>homeManager</code>/<code>nixos</code>

- <code>csConfig</code>: <code>homeManager</code>

- <code>desktop</code>: <code>homeManager</code>/<code>nixos</code>

- <code>desktop-programs</code>: <code>homeManager</code>

- <code>dev</code>: <code>nixos</code>

- <code>display-manager</code>: <code>nixos</code>

- <code>dunst</code>: <code>homeManager</code>

- <code>email</code>: <code>homeManager</code>

- <code>firefox</code>: <code>homeManager</code>

- <code>flameshot</code>: <code>homeManager</code>

- <code>foot</code>: <code>homeManager</code>

- <code>gammastep</code>: <code>homeManager</code>

- <code>gtk</code>: <code>homeManager</code>

- <code>home-manager</code>: <code>homeManager</code>/<code>nixos</code>

- <code>host_cuda</code>: <code>homeManager</code>/<code>nixos</code>

- <code>host_feroe</code>: <code>nixos</code>

- <code>host_framework</code>: <code>homeManager</code>/<code>nixos</code>

- <code>host_inria</code>: <code>homeManager</code>

- <code>host_jrs</code>: <code>homeManager</code>

- <code>host_tank</code>: <code>nixos</code>

- <code>host_vps</code>: <code>nixos</code>

- <code>kanshi</code>: <code>homeManager</code>

- <code>keyring</code>: <code>homeManager</code>

- <code>nh</code>: <code>homeManager</code>

- <code>nix</code>: <code>homeManager</code>/<code>nixos</code>

- <code>nix-index-database</code>: <code>homeManager</code>

- <code>nvidia</code>: <code>nixos</code>

- <code>obs</code>: <code>nixos</code>

- <code>printing</code>: <code>nixos</code>

- <code>remote-builders</code>: <code>nixos</code>

- <code>rofi</code>: <code>homeManager</code>

- <code>security</code>: <code>nixos</code>

- <code>server</code>: <code>nixos</code>

- <code>sound</code>: <code>nixos</code>

- <code>ssh-client</code>: <code>nixos</code>

- <code>ssh-server</code>: <code>nixos</code>

- <code>streaming</code>: <code>homeManager</code>

- <code>substituters</code>: <code>homeManager</code>/<code>nixos</code>

- <code>sway</code>: <code>homeManager</code>

- <code>swaylock</code>: <code>homeManager</code>

- <code>thunar</code>: <code>nixos</code>

- <code>udiskie</code>: <code>homeManager</code>

- <code>users</code>: <code>nixos</code>

- <code>waybar</code>: <code>homeManager</code>

- <code>wayland</code>: <code>homeManager</code>

- <code>wireguard-client</code>: <code>nixos</code>

- <code>xdg</code>: <code>homeManager</code>

- <code>zathura</code>: <code>homeManager</code>

</details>

No community notes on gaetanlepage-nix-config. Use the source, Luke.

- default: [`modules`](https://github.com/gaetanlepage/nix-config/tree/a17aca5073f9bc51e3660a5015b03d6513a87573/modules)

gaetanlepage-nix-config's ./modules tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.default
  ];
}
```

</details>

### [henrysipp-nix-setup](https://github.com/henrysipp/nix-setup/tree/0a9d314d352f934ee3c457a865f29377c51020a8/modules)

<details>
<summary>

henrysipp-nix-setup at rev 0a9d314.
1 dendritic trees.
<b>19</b> aspects across 6 nix classes.
49 nix configuration files.

</summary>

[README](https://github.com/henrysipp/nix-setup/tree/0a9d314d352f934ee3c457a865f29377c51020a8/README.md)

<details>
<summary>

##### henrysipp-nix-setup defines <b>19</b> aspects across 6 nix classes.

</summary>

- <code>albion</code>: <code>hosts</code>

- <code>allowedUnfreePackages</code>: <code>nixpkgs</code>

- <code>base</code>: <code>homeManager</code>/<code>nixos</code>

- <code>containers</code>: <code>nixos</code>

- <code>darwin-desktop</code>: <code>homeManager</code>

- <code>desktop</code>: <code>darwin</code>/<code>homeManager</code>/<code>nixos</code>

- <code>dev</code>: <code>homeManager</code>/<code>nixos</code>

- <code>games</code>: <code>homeManager</code>/<code>nixos</code>

- <code>gawain</code>: <code>hosts</code>

- <code>gnome</code>: <code>nixos</code>

- <code>guren</code>: <code>hosts</code>

- <code>henry</code>: <code>nixosUsers</code>

- <code>hyprland</code>: <code>homeManager</code>/<code>nixos</code>

- <code>nixvim</code>: <code>homeManager</code>

- <code>plasma</code>: <code>homeManager</code>/<code>nixos</code>

- <code>root</code>: <code>nixosUsers</code>

- <code>shell</code>: <code>darwin</code>/<code>homeManager</code>/<code>nixos</code>

- <code>system</code>: <code>darwin</code>

- <code>work</code>: <code>darwin</code>

</details>

No community notes on henrysipp-nix-setup. Use the source, Luke.

- default: [`modules`](https://github.com/henrysipp/nix-setup/tree/0a9d314d352f934ee3c457a865f29377c51020a8/modules)

henrysipp-nix-setup's ./modules tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.default
  ];
}
```

</details>

### [icyd-nixvim](https://github.com/icyd/nixvim/tree/6bf416ad3ba76a24afb287fa989561f5bcde1bd2/modules)

<details>
<summary>

icyd-nixvim at rev 6bf416a.
1 dendritic trees.
<b>30</b> aspects across 2 nix classes.
41 nix configuration files.

</summary>

[README](https://github.com/icyd/nixvim/tree/6bf416ad3ba76a24afb287fa989561f5bcde1bd2/README.md)

<details>
<summary>

##### icyd-nixvim defines <b>30</b> aspects across 2 nix classes.

</summary>

- <code>additional-plugins</code>: <code>nixvim</code>

- <code>auto-session</code>: <code>nixvim</code>

- <code>colorizer</code>: <code>nixvim</code>

- <code>compiler</code>: <code>nixvim</code>

- <code>completion</code>: <code>nixvim</code>

- <code>core</code>: <code>config</code>/<code>nixvim</code>

- <code>debug</code>: <code>nixvim</code>

- <code>dial</code>: <code>nixvim</code>

- <code>firenvim</code>: <code>nixvim</code>

- <code>full</code>: <code>config</code>

- <code>git</code>: <code>nixvim</code>

- <code>harpoon</code>: <code>nixvim</code>

- <code>lsp</code>: <code>nixvim</code>

- <code>markdown</code>: <code>nixvim</code>

- <code>maximize</code>: <code>nixvim</code>

- <code>navigator</code>: <code>nixvim</code>

- <code>neorg</code>: <code>nixvim</code>

- <code>oil</code>: <code>nixvim</code>

- <code>optimizations</code>: <code>nixvim</code>

- <code>overseer</code>: <code>nixvim</code>

- <code>project-nvim</code>: <code>nixvim</code>

- <code>telescope</code>: <code>nixvim</code>

- <code>tests</code>: <code>nixvim</code>

- <code>todo-comments</code>: <code>nixvim</code>

- <code>treesitter</code>: <code>nixvim</code>

- <code>trouble</code>: <code>nixvim</code>

- <code>ufo</code>: <code>nixvim</code>

- <code>ui</code>: <code>nixvim</code>

- <code>utils</code>: <code>nixvim</code>

- <code>yanky</code>: <code>nixvim</code>

</details>

No community notes on icyd-nixvim. Use the source, Luke.

- default: [`modules`](https://github.com/icyd/nixvim/tree/6bf416ad3ba76a24afb287fa989561f5bcde1bd2/modules)

icyd-nixvim's ./modules tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.default
  ];
}
```

</details>

### [quasigod-nixconfig](https://codeberg.org/vic/quasigod-nixconfig/src/commit/4326b7976ff363f83a461700a4567859830906bf/modules)

<details>
<summary>

quasigod-nixconfig at rev 4326b79.
1 dendritic trees.
<b>19</b> aspects across 2 nix classes.
59 nix configuration files.

</summary>

[README](https://codeberg.org/vic/quasigod-nixconfig/src/commit/4326b7976ff363f83a461700a4567859830906bf/README.md)

<details>
<summary>

##### quasigod-nixconfig defines <b>19</b> aspects across 2 nix classes.

</summary>

- <code>cachix</code>: <code>home</code>/<code>nixos</code>

- <code>default</code>: <code>home</code>/<code>nixos</code>

- <code>gaming</code>: <code>home</code>/<code>nixos</code>

- <code>hacking</code>: <code>home</code>/<code>nixos</code>

- <code>laptop</code>: <code>home</code>/<code>nixos</code>

- <code>localai</code>: <code>home</code>/<code>nixos</code>

- <code>plymouth</code>: <code>home</code>/<code>nixos</code>

- <code>remote</code>: <code>home</code>/<code>nixos</code>

- <code>replays</code>: <code>home</code>/<code>nixos</code>

- <code>secure-boot</code>: <code>home</code>/<code>nixos</code>

- <code>server</code>: <code>home</code>/<code>nixos</code>

- <code>ssh</code>: <code>home</code>/<code>nixos</code>

- <code>syncthing-client</code>: <code>home</code>/<code>nixos</code>

- <code>syncthing-server</code>: <code>home</code>/<code>nixos</code>

- <code>virtualisation</code>: <code>home</code>/<code>nixos</code>

- <code>waydroid</code>: <code>home</code>/<code>nixos</code>

- <code>workstation</code>: <code>home</code>/<code>nixos</code>

- <code>zfs</code>: <code>home</code>/<code>nixos</code>

- <code>zsa-kb</code>: <code>home</code>/<code>nixos</code>

</details>

No community notes on quasigod-nixconfig. Use the source, Luke.

- default: [`modules`](https://codeberg.org/vic/quasigod-nixconfig/src/commit/4326b7976ff363f83a461700a4567859830906bf/modules)

quasigod-nixconfig's ./modules tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.default
  ];
}
```

</details>

### [vic-vix](https://github.com/vic/vix/tree/f31e8a10fd4dc69980d661bbd610f4aa551fbbb0/modules/community)

<details>
<summary>

vic-vix at rev f31e8a1.
2 dendritic trees.
<b>24</b> aspects across 3 nix classes.
44 nix configuration files.

</summary>

[README](https://github.com/vic/vix/tree/f31e8a10fd4dc69980d661bbd610f4aa551fbbb0/README.md)

<details>
<summary>

##### vic-vix defines <b>24</b> aspects across 3 nix classes.

</summary>

- <code>aarch64-darwin</code>: <code>darwin</code>

- <code>aarch64-linux</code>: <code>nixos</code>

- <code>all-firmware</code>: <code>nixos</code>

- <code>bootable</code>: <code>nixos</code>

- <code>darwin</code>: <code>darwin</code>

- <code>gnome-desktop</code>: <code>nixos</code>

- <code>kde-desktop</code>: <code>nixos</code>

- <code>kvm-amd</code>: <code>nixos</code>

- <code>kvm-intel</code>: <code>nixos</code>

- <code>macos-keys</code>: <code>nixos</code>

- <code>nix-index</code>: <code>homeManager</code>

- <code>nix-registry</code>: <code>homeManager</code>

- <code>nix-settings</code>: <code>nixos</code>

- <code>nixos</code>: <code>nixos</code>

- <code>nvidia</code>: <code>nixos</code>

- <code>rdesk</code>: <code>homeManager</code>/<code>nixos</code>

- <code>unfree</code>: <code>nixos</code>

- <code>vscode-server</code>: <code>homeManager</code>

- <code>wl-broadcom</code>: <code>nixos</code>

- <code>wsl</code>: <code>nixos</code>

- <code>x86_64-darwin</code>: <code>darwin</code>

- <code>x86_64-linux</code>: <code>nixos</code>

- <code>xfce-desktop</code>: <code>nixos</code>

- <code>vic</code>: <code>darwin</code>/<code>homeManager</code>/<code>nixos</code>

</details>

No community notes on vic-vix. Use the source, Luke.

- default: [`modules/community`](https://github.com/vic/vix/tree/f31e8a10fd4dc69980d661bbd610f4aa551fbbb0/modules/community)

vic-vix's ./modules/community tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.default
  ];
}
```

- vic: [`modules/vic`](https://github.com/vic/vix/tree/f31e8a10fd4dc69980d661bbd610f4aa551fbbb0/modules/vic)

vic-vix's ./modules/vic tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.vic
  ];
}
```

</details>

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
TODO
</summary>

TODO

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
