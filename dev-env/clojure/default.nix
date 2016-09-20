with import <nixpkgs> {};
stdenv.mkDerivation rec {
  name = "env";
  env = buildEnv { name = name; paths = buildInputs; };
  
  shellHook = ''
    echo "Welcome to the clojure world!"
  '';

  buildInputs = [
	leiningen
	emacs25pre
  ];
}
