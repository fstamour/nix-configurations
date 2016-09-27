# Put this file in ~/.nixpkgs/config.nix
# This can be installed with nix-env -i myPackages
{

  imports = [ ./local.nix ];

  packageOverrides = pkgs_: with pkgs_; {

    myVim = vim_configurable.customize {
      name = "vim";

      vimrcConfig.vam = {
        knownPlugins = pkgs.vimPlugins;
        pluginDictionaries = [
          {names = [
              "Syntastic"
              "youcompleteme"
              "ctrlp"
              "sensible"
              "colors-solarized"
              "vim-colorschemes"
              "vim-css-color"
              "vim-startify"
           ];}
        ];
      };
    };


    myPackages = with pkgs; buildEnv {
      name = "myPackages";
      paths = [
        myVim
        emacs25pre

        # Spell-checking
        hunspell
        hunspellDicts.fr-moderne
        hunspellDicts.fr-any
        hunspellDicts.en-gb-ize
        hunspellDicts.es-cu

        # asciinema is a tool to record (and share) terminal sessions
        asciinema
      ];
    };
  };
}
