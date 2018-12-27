#!/usr/bin/env nix-shell
#!nix-shell ./machineLearningNotebook.nix --command "jupyter notebook"

with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "machineLearningNotebook";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    python36Packages.notebook
    python36Packages.numpy
    python36Packages.scipy
    python36Packages.scikitlearn
    python36Packages.scikitimage
    python36Packages.matplotlib
    python36Packages.seaborn # high-level interface for matplotlib
  ];
}

