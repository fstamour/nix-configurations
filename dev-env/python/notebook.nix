#!/usr/bin/env nix-shell 
#!nix-shell ./notebook.nix --command "jupyter notebook"

with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "python3Notebook";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    python36Packages.notebook
  ];
}

