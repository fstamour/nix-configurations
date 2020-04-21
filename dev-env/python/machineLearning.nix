#!/usr/bin/env nix-shell
#!nix-shell ./machineLearning.nix

with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "machineLearning";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    python37Packages.numpy
    python37Packages.scipy
    python37Packages.scikitlearn
    python37Packages.scikitimage
    python37Packages.matplotlib
    python37Packages.seaborn # high-level interface for matplotlib
  ];
}

