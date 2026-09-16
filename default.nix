let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-26.05";
  pkgs = import nixpkgs {
    config = { };
    overlays = [ ];
  };
in
{
  hol4 = pkgs.callPackage ./hol4.nix { };

  shellHook = ''
    echo "hello hol4"
    export HOLDIR="$hol4/holdir/"
  '';

}
