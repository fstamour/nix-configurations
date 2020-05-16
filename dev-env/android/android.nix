#!/usr/bin/env nix-shell
#!nix-shell ./android.nix

with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "env";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    # android-sdk
    android-studio-stable
  ];
}
