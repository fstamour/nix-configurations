# Put this file in ~/.nixpkgs/config.nix
# This can be installed with nix-env -i myPackages
{
  packageOverrides = pkgs_: with pkgs_; {
    myPackages = with pkgs; buildEnv {
      name = "myPackages";
      paths = [ emacs25pre
      
            # Spell-checking
            hunspell
            hunspellDicts.fr-moderne
            hunspellDicts.fr-any
            hunspellDicts.en-gb-ize
            hunspellDicts.es-cu
      ];
    };
  };
}
