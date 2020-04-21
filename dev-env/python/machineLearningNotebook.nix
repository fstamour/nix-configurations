#!/usr/bin/env nix-shell
#!nix-shell ./machineLearningNotebook.nix --command "jupyter notebook"

with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "machineLearningNotebook";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    python37Packages.notebook
    python37Packages.numpy
    python37Packages.scipy
    python37Packages.scikitlearn
    python37Packages.scikitimage
    python37Packages.matplotlib
    python37Packages.seaborn # high-level interface for matplotlib
  ];
}

