#!/run/current-system/sw/bin/nix-instantiate

# This is an example where we simply fetch something from github and package it in a tar file.

with import <nixpkgs> {};
stdenv.mkDerivation rec {
  name = "spacemacs-tarfile";

  src = fetchgit {
    url = "https://github.com/syl20bnr/spacemacs.git";
    rev = "9f9faa404e3dec3e08cc73cf7b5a0439fc309800";
    sha256 = "06sxw5v6im71dzk7kr7lf9mkwrz2jfx9cfrysy7x8c99m08xdasz";
  };

  phases = "packagePhase";

  packagePhase = ''
  mkdir -p $out
  echo $out created
  tar -zcvvf $out/asdf.tar.gz ${src}
  '';
}
