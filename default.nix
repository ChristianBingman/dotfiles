{ nixpkgs ? import <nixpkgs> {  } }:

let
  pkgs = [
    nixpkgs.ripgrep
  ];
 
in
  nixpkgs.stdenv.mkDerivation {
    name = "env";
    buildInputs = pkgs;
  }
