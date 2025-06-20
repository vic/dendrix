# Transposes an attribute set like:
#     {
#       nixos = {
#         foo = 1;
#         bar = 2;
#       };
#       darwin = {
#         bar = 3;
#         baz = 4;
#       };
#     }
#
# Into
#     {
#       foo = {
#         nixos = ...;
#       };
#       bar = {
#         nixos = ...;
#         darwin = ...;
#       };
#       baz = {
#         darwin = ...;
#       };
#     }
#
lib:
let
  transposeChild = child: parent: value: { inherit child parent value; };
  eachChildAttrs = parent: lib.mapAttrsToList (transposeChild parent);
  accTransposed =
    acc:
    {
      parent,
      child,
      value,
    }:
    acc
    // {
      ${parent} = (acc.${parent} or { }) // {
        ${child} = value;
      };
    };

  transpose =
    attrs:
    lib.pipe attrs [
      (lib.mapAttrsToList eachChildAttrs)
      (lib.flatten)
      (lib.foldl accTransposed { })
    ];
in
transpose
