{
  description = "HOL4 interactive theorem prover";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      hol4 = pkgs.callPackage ./hol4.nix { };
    in
    {
      packages.${system} = {
        default = hol4;
      };
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.polyml
          hol4
        ];
        shellHook = ''
          echo "hello hol4"
          export HOLDIR="$hol4/holdir/"
        '';
      };
    };
}
