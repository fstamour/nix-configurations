with import <nixpkgs> {};
stdenv.mkDerivation rec {
  name = "env";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    avrdude
    # avrgcclib # doesn't exists on 19.09 anymore
    simavr
  ];
}
