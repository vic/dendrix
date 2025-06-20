{
  outputs = _: {
    flakeModule.imports = [
      ./dev/modules/community-option.nix
      ./dev/modules/community.nix
    ];
  };
}
