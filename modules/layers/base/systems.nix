{ inputs, ... }:
{
  systems = import inputs.systems;

  # define modules that will be included on hosts having systems.
  # later layers can contribute to these modules.
  flake.modules.nixos.x86_64-linux = { };
  flake.modules.nixos.arm64-linux = { };
  flake.modules.darwin.x86_64-darwin = { };
  flake.modules.darwin.arm64-darwin = { };

  # per operating system.
  flake.modules.nixos.nixos = { };
  flake.modules.nixos.wsl = { };
  flake.modules.darwin.darwin = { };
}
