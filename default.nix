{ pkgs ? import <nixpkgs> {  } }:

let
  localpkgs = if builtins.pathExists ./local-packages.nix then 
    (import ./local-packages.nix pkgs).buildInputs else [];
in
  pkgs.stdenv.mkDerivation {
    name = "env";
    buildInputs = (with pkgs; [
      ripgrep
      openssh
    ]) ++ localpkgs;
  }
