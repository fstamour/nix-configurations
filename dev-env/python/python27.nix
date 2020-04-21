#!/usr/bin/env nix-shell 
#!nix-shell ./python27.nix

with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "env";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    python
    python27Packages.pip
  ];
}
