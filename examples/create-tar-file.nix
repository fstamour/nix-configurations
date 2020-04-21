#!/run/current-system/sw/bin/nix-instantiate

# This is an example where we simply fetch something from github and package it in a tar file.

with import <nixpkgs> {};
stdenv.mkDerivation rec {
  name = "spacemacs-tarfile";

  src = fetchgit {
    url = "https://github.com/syl20bnr/spacemacs.git";
    rev = "9f9faa404e3dec3e08cc73cf7b5a0439fc309800";
    sha256 = "1hr4niq0c4p08ikjm7v2i2xbd2bjlldcgibzjssl1gsd4xzxnqkg";
  };

  phases = "packagePhase";

  packagePhase = ''
  mkdir -p $out
  echo $out created
  tar -zcvvf $out/asdf.tar.gz ${src}
  '';
}
