# Put this file in ~/.nixpkgs/config.nix
# This can be installed with nix-env -i myPackages
{

  imports = [ ./local.nix ];

  vim.python = true;

  packageOverrides = pkgs_: with pkgs_; {

    myVim = vim_configurable.customize {
      name = "vim";

      vimrcConfig.customRC = ''
set tabstop=2
set expandtab
set shiftwidth=2

" Save and run the current file on F5
" nmap <F5> <ESC>:w \|\| :! ./% <CR>

syntax on
set bg=dark
'';

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
              "rainbow_parentheses"
           ];}
        ];
      };
    };


    myPackages = with pkgs; buildEnv {
      name = "myPackages";
      paths = [
        myVim
        emacs25

        # Spell-checking
        hunspell
        hunspellDicts.fr-moderne
        hunspellDicts.fr-any
        hunspellDicts.en-gb-ize
        # hunspellDicts.es-cu

        # asciinema is a tool to record (and share) terminal sessions
        asciinema
      ];
    };
  };
}
