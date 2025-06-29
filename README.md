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
203 [import-trees](https://github.com/vic/dendrix/tree/main/dev/modules/community).
9 flags.
162 aspects accross 9 different nix configuration classes.
612 nix configuration files.

</summary>

### [Maka-77x-nixconf7](https://github.com/Maka-77x/nixconf7/tree/e3fd4cacd66d708911109b3a0f43f7b65d8be7bd

<details>
<summary>

Maka-77x-nixconf7 at rev e3fd4ca.
22 dendritic trees.
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

- ai:

Maka-77x-nixconf7's ai tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.ai
  ];
}
```

- base:

Maka-77x-nixconf7's base tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.base
  ];
}
```

- bluetooth:

Maka-77x-nixconf7's bluetooth tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.bluetooth
  ];
}
```

- desktop:

Maka-77x-nixconf7's desktop tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.desktop
  ];
}
```

- dev:

Maka-77x-nixconf7's dev tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.dev
  ];
}
```

- displaylink:

Maka-77x-nixconf7's displaylink tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.displaylink
  ];
}
```

- email:

Maka-77x-nixconf7's email tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.email
  ];
}
```

- facter:

Maka-77x-nixconf7's facter tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.facter
  ];
}
```

- fwupd:

Maka-77x-nixconf7's fwupd tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.fwupd
  ];
}
```

- games:

Maka-77x-nixconf7's games tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.games
  ];
}
```

- guacamole:

Maka-77x-nixconf7's guacamole tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.guacamole
  ];
}
```

- hosts/gouda:

Maka-77x-nixconf7's hosts/gouda tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.hosts/gouda
  ];
}
```

- hosts/nixos:

Maka-77x-nixconf7's hosts/nixos tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.hosts/nixos
  ];
}
```

- messaging:

Maka-77x-nixconf7's messaging tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.messaging
  ];
}
```

- mimi:

Maka-77x-nixconf7's mimi tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.mimi
  ];
}
```

- openssh:

Maka-77x-nixconf7's openssh tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.openssh
  ];
}
```

- root:

Maka-77x-nixconf7's root tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.root
  ];
}
```

- shell:

Maka-77x-nixconf7's shell tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.shell
  ];
}
```

- sound:

Maka-77x-nixconf7's sound tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.sound
  ];
}
```

- virtualisation:

Maka-77x-nixconf7's virtualisation tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.virtualisation
  ];
}
```

- vpn:

Maka-77x-nixconf7's vpn tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.vpn
  ];
}
```

- work:

Maka-77x-nixconf7's work tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.Maka-77x-nixconf7.work
  ];
}
```

</details>

### [dliberalesso-nix-config](https://github.com/dliberalesso/nix-config/tree/c2906862413dccd1745ce26e0172cac4381c34bd

<details>
<summary>

dliberalesso-nix-config at rev c290686.
8 dendritic trees.
<b>8</b> aspects across 2 nix classes.
85 nix configuration files.

</summary>

[README](https://github.com/dliberalesso/nix-config/tree/c2906862413dccd1745ce26e0172cac4381c34bd/README.md)

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

- default:

dliberalesso-nix-config's default tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.dliberalesso-nix-config.default
  ];
}
```

- facter:

dliberalesso-nix-config's facter tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.dliberalesso-nix-config.facter
  ];
}
```

- gui:

dliberalesso-nix-config's gui tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.dliberalesso-nix-config.gui
  ];
}
```

- hyprde:

dliberalesso-nix-config's hyprde tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.dliberalesso-nix-config.hyprde
  ];
}
```

- irpf:

dliberalesso-nix-config's irpf tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.dliberalesso-nix-config.irpf
  ];
}
```

- laptop:

dliberalesso-nix-config's laptop tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.dliberalesso-nix-config.laptop
  ];
}
```

- work:

dliberalesso-nix-config's work tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.dliberalesso-nix-config.work
  ];
}
```

- wsl:

dliberalesso-nix-config's wsl tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.dliberalesso-nix-config.wsl
  ];
}
```

</details>

### [drupol-infra](https://github.com/drupol/infra/tree/a10da3a0e88d17566918fa8db69fa0faa9e1d0c8

<details>
<summary>

drupol-infra at rev a10da3a.
24 dendritic trees.
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

- ai:

drupol-infra's ai tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.ai
  ];
}
```

- base:

drupol-infra's base tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.base
  ];
}
```

- bluetooth:

drupol-infra's bluetooth tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.bluetooth
  ];
}
```

- desktop:

drupol-infra's desktop tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.desktop
  ];
}
```

- dev:

drupol-infra's dev tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.dev
  ];
}
```

- displaylink:

drupol-infra's displaylink tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.displaylink
  ];
}
```

- email:

drupol-infra's email tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.email
  ];
}
```

- facter:

drupol-infra's facter tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.facter
  ];
}
```

- fwupd:

drupol-infra's fwupd tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.fwupd
  ];
}
```

- games:

drupol-infra's games tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.games
  ];
}
```

- guacamole:

drupol-infra's guacamole tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.guacamole
  ];
}
```

- hosts/nixos:

drupol-infra's hosts/nixos tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.hosts/nixos
  ];
}
```

- hosts/x13:

drupol-infra's hosts/x13 tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.hosts/x13
  ];
}
```

- hosts/x260:

drupol-infra's hosts/x260 tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.hosts/x260
  ];
}
```

- hosts/x280:

drupol-infra's hosts/x280 tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.hosts/x280
  ];
}
```

- hosts/xeonixos:

drupol-infra's hosts/xeonixos tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.hosts/xeonixos
  ];
}
```

- messaging:

drupol-infra's messaging tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.messaging
  ];
}
```

- openssh:

drupol-infra's openssh tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.openssh
  ];
}
```

- pol:

drupol-infra's pol tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.pol
  ];
}
```

- root:

drupol-infra's root tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.root
  ];
}
```

- shell:

drupol-infra's shell tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.shell
  ];
}
```

- sound:

drupol-infra's sound tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.sound
  ];
}
```

- vpn:

drupol-infra's vpn tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.vpn
  ];
}
```

- work:

drupol-infra's work tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.drupol-infra.work
  ];
}
```

</details>

### [gaetanlepage-nix-config](https://github.com/gaetanlepage/nix-config/tree/1d2b2faa7dc402b64e4fad02dd8ce85bce5c15cd

<details>
<summary>

gaetanlepage-nix-config at rev 1d2b2fa.
55 dendritic trees.
<b>55</b> aspects across 2 nix classes.
131 nix configuration files.

</summary>

[README](https://github.com/gaetanlepage/nix-config/tree/1d2b2faa7dc402b64e4fad02dd8ce85bce5c15cd/README.md)

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

- agenix:

gaetanlepage-nix-config's agenix tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.agenix
  ];
}
```

- android:

gaetanlepage-nix-config's android tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.android
  ];
}
```

- bg-stream:

gaetanlepage-nix-config's bg-stream tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.bg-stream
  ];
}
```

- bluetooth:

gaetanlepage-nix-config's bluetooth tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.bluetooth
  ];
}
```

- bootloader:

gaetanlepage-nix-config's bootloader tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.bootloader
  ];
}
```

- caddy-reverse-proxies:

gaetanlepage-nix-config's caddy-reverse-proxies tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.caddy-reverse-proxies
  ];
}
```

- cloud-backup:

gaetanlepage-nix-config's cloud-backup tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.cloud-backup
  ];
}
```

- core:

gaetanlepage-nix-config's core tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.core
  ];
}
```

- csConfig:

gaetanlepage-nix-config's csConfig tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.csConfig
  ];
}
```

- desktop:

gaetanlepage-nix-config's desktop tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.desktop
  ];
}
```

- desktop-programs:

gaetanlepage-nix-config's desktop-programs tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.desktop-programs
  ];
}
```

- dev:

gaetanlepage-nix-config's dev tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.dev
  ];
}
```

- display-manager:

gaetanlepage-nix-config's display-manager tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.display-manager
  ];
}
```

- dunst:

gaetanlepage-nix-config's dunst tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.dunst
  ];
}
```

- email:

gaetanlepage-nix-config's email tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.email
  ];
}
```

- firefox:

gaetanlepage-nix-config's firefox tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.firefox
  ];
}
```

- flameshot:

gaetanlepage-nix-config's flameshot tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.flameshot
  ];
}
```

- foot:

gaetanlepage-nix-config's foot tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.foot
  ];
}
```

- gammastep:

gaetanlepage-nix-config's gammastep tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.gammastep
  ];
}
```

- gtk:

gaetanlepage-nix-config's gtk tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.gtk
  ];
}
```

- home-manager:

gaetanlepage-nix-config's home-manager tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.home-manager
  ];
}
```

- host_cuda:

gaetanlepage-nix-config's host_cuda tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.host_cuda
  ];
}
```

- host_feroe:

gaetanlepage-nix-config's host_feroe tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.host_feroe
  ];
}
```

- host_framework:

gaetanlepage-nix-config's host_framework tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.host_framework
  ];
}
```

- host_inria:

gaetanlepage-nix-config's host_inria tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.host_inria
  ];
}
```

- host_jrs:

gaetanlepage-nix-config's host_jrs tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.host_jrs
  ];
}
```

- host_tank:

gaetanlepage-nix-config's host_tank tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.host_tank
  ];
}
```

- host_vps:

gaetanlepage-nix-config's host_vps tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.host_vps
  ];
}
```

- kanshi:

gaetanlepage-nix-config's kanshi tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.kanshi
  ];
}
```

- keyring:

gaetanlepage-nix-config's keyring tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.keyring
  ];
}
```

- nh:

gaetanlepage-nix-config's nh tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.nh
  ];
}
```

- nix:

gaetanlepage-nix-config's nix tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.nix
  ];
}
```

- nix-index-database:

gaetanlepage-nix-config's nix-index-database tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.nix-index-database
  ];
}
```

- nvidia:

gaetanlepage-nix-config's nvidia tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.nvidia
  ];
}
```

- obs:

gaetanlepage-nix-config's obs tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.obs
  ];
}
```

- printing:

gaetanlepage-nix-config's printing tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.printing
  ];
}
```

- remote-builders:

gaetanlepage-nix-config's remote-builders tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.remote-builders
  ];
}
```

- rofi:

gaetanlepage-nix-config's rofi tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.rofi
  ];
}
```

- security:

gaetanlepage-nix-config's security tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.security
  ];
}
```

- server:

gaetanlepage-nix-config's server tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.server
  ];
}
```

- sound:

gaetanlepage-nix-config's sound tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.sound
  ];
}
```

- ssh-client:

gaetanlepage-nix-config's ssh-client tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.ssh-client
  ];
}
```

- ssh-server:

gaetanlepage-nix-config's ssh-server tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.ssh-server
  ];
}
```

- streaming:

gaetanlepage-nix-config's streaming tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.streaming
  ];
}
```

- substituters:

gaetanlepage-nix-config's substituters tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.substituters
  ];
}
```

- sway:

gaetanlepage-nix-config's sway tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.sway
  ];
}
```

- swaylock:

gaetanlepage-nix-config's swaylock tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.swaylock
  ];
}
```

- thunar:

gaetanlepage-nix-config's thunar tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.thunar
  ];
}
```

- udiskie:

gaetanlepage-nix-config's udiskie tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.udiskie
  ];
}
```

- users:

gaetanlepage-nix-config's users tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.users
  ];
}
```

- waybar:

gaetanlepage-nix-config's waybar tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.waybar
  ];
}
```

- wayland:

gaetanlepage-nix-config's wayland tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.wayland
  ];
}
```

- wireguard-client:

gaetanlepage-nix-config's wireguard-client tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.wireguard-client
  ];
}
```

- xdg:

gaetanlepage-nix-config's xdg tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.xdg
  ];
}
```

- zathura:

gaetanlepage-nix-config's zathura tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.gaetanlepage-nix-config.zathura
  ];
}
```

</details>

### [henrysipp-nix-setup](https://github.com/henrysipp/nix-setup/tree/5fbfdf52685dd13ecf96e418a9a83af95787e787

<details>
<summary>

henrysipp-nix-setup at rev 5fbfdf5.
21 dendritic trees.
<b>21</b> aspects across 6 nix classes.
48 nix configuration files.

</summary>

[README](https://github.com/henrysipp/nix-setup/tree/5fbfdf52685dd13ecf96e418a9a83af95787e787/README.md)

<details>
<summary>

##### henrysipp-nix-setup defines <b>21</b> aspects across 6 nix classes.

</summary>

- <code>albion</code>: <code>hosts</code>

- <code>allowedUnfreePackages</code>: <code>nixpkgs</code>

- <code>base</code>: <code>homeManager</code>/<code>nixos</code>

- <code>containers</code>: <code>nixos</code>

- <code>darwin-desktop</code>: <code>homeManager</code>

- <code>desktop</code>: <code>darwin</code>/<code>homeManager</code>/<code>nixos</code>

- <code>dev</code>: <code>homeManager</code>/<code>nixos</code>

- <code>fonts</code>: <code>homeManager</code>/<code>nixos</code>

- <code>games</code>: <code>homeManager</code>/<code>nixos</code>

- <code>gawain</code>: <code>hosts</code>

- <code>gnome</code>: <code>homeManager</code>/<code>nixos</code>

- <code>guren</code>: <code>hosts</code>

- <code>henry</code>: <code>nixosUsers</code>

- <code>nixvim</code>: <code>homeManager</code>

- <code>packages</code>: <code>nixos</code>

- <code>plasma</code>: <code>homeManager</code>/<code>nixos</code>

- <code>root</code>: <code>nixosUsers</code>

- <code>shell</code>: <code>darwin</code>/<code>homeManager</code>/<code>nixos</code>

- <code>sound</code>: <code>nixos</code>

- <code>system</code>: <code>darwin</code>

- <code>work</code>: <code>darwin</code>

</details>

No community notes on henrysipp-nix-setup. Use the source, Luke.

- albion:

henrysipp-nix-setup's albion tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.albion
  ];
}
```

- allowedUnfreePackages:

henrysipp-nix-setup's allowedUnfreePackages tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.allowedUnfreePackages
  ];
}
```

- base:

henrysipp-nix-setup's base tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.base
  ];
}
```

- containers:

henrysipp-nix-setup's containers tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.containers
  ];
}
```

- darwin-desktop:

henrysipp-nix-setup's darwin-desktop tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.darwin-desktop
  ];
}
```

- desktop:

henrysipp-nix-setup's desktop tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.desktop
  ];
}
```

- dev:

henrysipp-nix-setup's dev tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.dev
  ];
}
```

- fonts:

henrysipp-nix-setup's fonts tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.fonts
  ];
}
```

- games:

henrysipp-nix-setup's games tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.games
  ];
}
```

- gawain:

henrysipp-nix-setup's gawain tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.gawain
  ];
}
```

- gnome:

henrysipp-nix-setup's gnome tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.gnome
  ];
}
```

- guren:

henrysipp-nix-setup's guren tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.guren
  ];
}
```

- henry:

henrysipp-nix-setup's henry tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.henry
  ];
}
```

- nixvim:

henrysipp-nix-setup's nixvim tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.nixvim
  ];
}
```

- packages:

henrysipp-nix-setup's packages tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.packages
  ];
}
```

- plasma:

henrysipp-nix-setup's plasma tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.plasma
  ];
}
```

- root:

henrysipp-nix-setup's root tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.root
  ];
}
```

- shell:

henrysipp-nix-setup's shell tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.shell
  ];
}
```

- sound:

henrysipp-nix-setup's sound tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.sound
  ];
}
```

- system:

henrysipp-nix-setup's system tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.system
  ];
}
```

- work:

henrysipp-nix-setup's work tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.henrysipp-nix-setup.work
  ];
}
```

</details>

### [icyd-nixvim](https://github.com/icyd/nixvim/tree/6bf416ad3ba76a24afb287fa989561f5bcde1bd2

<details>
<summary>

icyd-nixvim at rev 6bf416a.
30 dendritic trees.
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

- additional-plugins:

icyd-nixvim's additional-plugins tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.additional-plugins
  ];
}
```

- auto-session:

icyd-nixvim's auto-session tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.auto-session
  ];
}
```

- colorizer:

icyd-nixvim's colorizer tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.colorizer
  ];
}
```

- compiler:

icyd-nixvim's compiler tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.compiler
  ];
}
```

- completion:

icyd-nixvim's completion tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.completion
  ];
}
```

- core:

icyd-nixvim's core tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.core
  ];
}
```

- debug:

icyd-nixvim's debug tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.debug
  ];
}
```

- dial:

icyd-nixvim's dial tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.dial
  ];
}
```

- firenvim:

icyd-nixvim's firenvim tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.firenvim
  ];
}
```

- full:

icyd-nixvim's full tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.full
  ];
}
```

- git:

icyd-nixvim's git tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.git
  ];
}
```

- harpoon:

icyd-nixvim's harpoon tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.harpoon
  ];
}
```

- lsp:

icyd-nixvim's lsp tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.lsp
  ];
}
```

- markdown:

icyd-nixvim's markdown tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.markdown
  ];
}
```

- maximize:

icyd-nixvim's maximize tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.maximize
  ];
}
```

- navigator:

icyd-nixvim's navigator tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.navigator
  ];
}
```

- neorg:

icyd-nixvim's neorg tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.neorg
  ];
}
```

- oil:

icyd-nixvim's oil tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.oil
  ];
}
```

- optimizations:

icyd-nixvim's optimizations tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.optimizations
  ];
}
```

- overseer:

icyd-nixvim's overseer tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.overseer
  ];
}
```

- project-nvim:

icyd-nixvim's project-nvim tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.project-nvim
  ];
}
```

- telescope:

icyd-nixvim's telescope tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.telescope
  ];
}
```

- tests:

icyd-nixvim's tests tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.tests
  ];
}
```

- todo-comments:

icyd-nixvim's todo-comments tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.todo-comments
  ];
}
```

- treesitter:

icyd-nixvim's treesitter tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.treesitter
  ];
}
```

- trouble:

icyd-nixvim's trouble tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.trouble
  ];
}
```

- ufo:

icyd-nixvim's ufo tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.ufo
  ];
}
```

- ui:

icyd-nixvim's ui tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.ui
  ];
}
```

- utils:

icyd-nixvim's utils tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.utils
  ];
}
```

- yanky:

icyd-nixvim's yanky tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.icyd-nixvim.yanky
  ];
}
```

</details>

### [quasigod-nixconfig](https://codeberg.org/vic/quasigod-nixconfig/src/commit/4326b7976ff363f83a461700a4567859830906bf

<details>
<summary>

quasigod-nixconfig at rev 4326b79.
19 dendritic trees.
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

- cachix:

quasigod-nixconfig's cachix tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.cachix
  ];
}
```

- default:

quasigod-nixconfig's default tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.default
  ];
}
```

- gaming:

quasigod-nixconfig's gaming tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.gaming
  ];
}
```

- hacking:

quasigod-nixconfig's hacking tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.hacking
  ];
}
```

- laptop:

quasigod-nixconfig's laptop tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.laptop
  ];
}
```

- localai:

quasigod-nixconfig's localai tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.localai
  ];
}
```

- plymouth:

quasigod-nixconfig's plymouth tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.plymouth
  ];
}
```

- remote:

quasigod-nixconfig's remote tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.remote
  ];
}
```

- replays:

quasigod-nixconfig's replays tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.replays
  ];
}
```

- secure-boot:

quasigod-nixconfig's secure-boot tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.secure-boot
  ];
}
```

- server:

quasigod-nixconfig's server tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.server
  ];
}
```

- ssh:

quasigod-nixconfig's ssh tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.ssh
  ];
}
```

- syncthing-client:

quasigod-nixconfig's syncthing-client tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.syncthing-client
  ];
}
```

- syncthing-server:

quasigod-nixconfig's syncthing-server tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.syncthing-server
  ];
}
```

- virtualisation:

quasigod-nixconfig's virtualisation tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.virtualisation
  ];
}
```

- waydroid:

quasigod-nixconfig's waydroid tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.waydroid
  ];
}
```

- workstation:

quasigod-nixconfig's workstation tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.workstation
  ];
}
```

- zfs:

quasigod-nixconfig's zfs tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.zfs
  ];
}
```

- zsa-kb:

quasigod-nixconfig's zsa-kb tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.quasigod-nixconfig.zsa-kb
  ];
}
```

</details>

### [vic-vix](https://github.com/vic/vix/tree/f31e8a10fd4dc69980d661bbd610f4aa551fbbb0

<details>
<summary>

vic-vix at rev f31e8a1.
24 dendritic trees.
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

- <code>vic</code>: <code>darwin</code>/<code>homeManager</code>/<code>nixos</code>

- <code>vscode-server</code>: <code>homeManager</code>

- <code>wl-broadcom</code>: <code>nixos</code>

- <code>wsl</code>: <code>nixos</code>

- <code>x86_64-darwin</code>: <code>darwin</code>

- <code>x86_64-linux</code>: <code>nixos</code>

- <code>xfce-desktop</code>: <code>nixos</code>

</details>

No community notes on vic-vix. Use the source, Luke.

- aarch64-darwin:

vic-vix's aarch64-darwin tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.aarch64-darwin
  ];
}
```

- aarch64-linux:

vic-vix's aarch64-linux tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.aarch64-linux
  ];
}
```

- all-firmware:

vic-vix's all-firmware tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.all-firmware
  ];
}
```

- bootable:

vic-vix's bootable tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.bootable
  ];
}
```

- darwin:

vic-vix's darwin tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.darwin
  ];
}
```

- gnome-desktop:

vic-vix's gnome-desktop tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.gnome-desktop
  ];
}
```

- kde-desktop:

vic-vix's kde-desktop tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.kde-desktop
  ];
}
```

- kvm-amd:

vic-vix's kvm-amd tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.kvm-amd
  ];
}
```

- kvm-intel:

vic-vix's kvm-intel tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.kvm-intel
  ];
}
```

- macos-keys:

vic-vix's macos-keys tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.macos-keys
  ];
}
```

- nix-index:

vic-vix's nix-index tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.nix-index
  ];
}
```

- nix-registry:

vic-vix's nix-registry tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.nix-registry
  ];
}
```

- nix-settings:

vic-vix's nix-settings tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.nix-settings
  ];
}
```

- nixos:

vic-vix's nixos tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.nixos
  ];
}
```

- nvidia:

vic-vix's nvidia tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.nvidia
  ];
}
```

- rdesk:

vic-vix's rdesk tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.rdesk
  ];
}
```

- unfree:

vic-vix's unfree tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.unfree
  ];
}
```

- vic:

vic-vix's vic tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.vic
  ];
}
```

- vscode-server:

vic-vix's vscode-server tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.vscode-server
  ];
}
```

- wl-broadcom:

vic-vix's wl-broadcom tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.wl-broadcom
  ];
}
```

- wsl:

vic-vix's wsl tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.wsl
  ];
}
```

- x86_64-darwin:

vic-vix's x86_64-darwin tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.x86_64-darwin
  ];
}
```

- x86_64-linux:

vic-vix's x86_64-linux tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.x86_64-linux
  ];
}
```

- xfce-desktop:

vic-vix's xfce-desktop tree

```nix
# usage on your layers.nix
{inputs, ...}: {
  imports = [
    inputs.dendrix.community.vic-vix.xfce-desktop
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
