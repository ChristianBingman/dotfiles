{ pkgs ? import <nixpkgs> {  } }:

let
  localpkgs = (import ./local-packages.nix pkgs).buildInputs;
in
  pkgs.stdenv.mkDerivation {
    name = "env";
    buildInputs = (with pkgs; [
      ripgrep
      openssh
    ]) ++ localpkgs;
  }
