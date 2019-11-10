# Put this file in ~/.nixpkgs/config.nix
# This can be installed with nix-env -i myPackages
{

  imports = [ ./local.nix ];

  allowUnfree = true; # For Discord

  vim.python = true;

  packageOverrides = pkgs_: with pkgs_; {

# see https://nixos.wiki/wiki/Vim
    myVim = vim_configurable.customize {
      name = "vim";

      vimrcConfig.customRC = ''
set encoding=utf-8
set shell=/bin/sh

set tabstop=2
set expandtab
set shiftwidth=2
set clipboard=unnamed

" don't forget to mkdir that folder
set directory=$HOME/.vim/swapfile//

set number
set relativenumber

syntax on
set bg=dark

set hidden
set hlsearch

let mapleader = " "

" windows!
map <leader>w <C-w>

" Highlight trailing whitespaces
match Todo /\s\+$/

iabbrev sl ls
iabbrev dc cd
iabbrev teh the
iabbrev paht path
iabbrev PAHT PATH
iabbrev lits list
iabbrev lenght length
iabbrev widht width
iabbrev height heigth

" insert date
" imap <expr> //date strftime("%Y-%m-%d")

" Type //sh or //bash to insert corresponding shebang
" nmap //sh ggO#!/usr/bin/env sh<Esc><C-o>
" nmap //bash ggO#!/usr/bin/env bash<Esc><C-o>

""" <leader>c  Bindings for c programming
" Switch between header and source files
nmap <leader>cs :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>

""" <leader>r  Bindings for rust programming
" Format current file using rustfmt
nmap <leader>rf :%!rustfmt<cr>
" Run with cargo
nmap <leader>rr :wa<cr>:!cargo run<cr>
" Run tests with cargo
nmap <leader>rt :wa<cr>:!cargo test<cr>
'';

      vimrcConfig.vam = {
        knownPlugins = pkgs.vimPlugins;
        pluginDictionaries = [
          {names = [
              "Syntastic"
              "colors-solarized"
              "ctrlp"
              "rainbow_parentheses"
              "sensible"
              "vim-colorschemes"
              "vim-css-color"
              "vim-startify"
              "youcompleteme"
           ];}
        ];
      };
    };


    myPackages = with pkgs; buildEnv {
      name = "myPackages";
      paths = [
        myVim

        # Spell-checking
        hunspell
        hunspellDicts.fr-moderne
        hunspellDicts.fr-any
        hunspellDicts.en-gb-ize
        hunspellDicts.es-cu

        asciinema # tool to record (and share) terminal sessions
        youtube-dl # download stuff from youtube

        # chat
        discord
      ] ++ [
        # machine learning
        octave
        tesseract

        # constaint programming
        minizinc
        gecode

        # formal methods
        tlaplusToolbox
        tetex # for pretty-printing TLA specs
      ] ++ [
        # clojure
        boot
        clojure

        # rust
        cargo

        # javascript
        nodejs

        # lisp
        ccl

        # general
        gnumake
        gdb
        ctags
        cmake
      ] ++ [
        # GUI stuff
        anki # space-repition something, I forgot..l
        chromium # shiny web browser
        copyq # clipboard manager
        evince # document viewer
        firefox # foxy web browser
        freemind # mind map
        freerdp # remote desktop (gui)
        keepassx2 # password manager
        libreoffice # office suite
        pavucontrol # sound settings
        shutter # for screenshots
        termite # terminal
        vlc # video player
        wxcam # webcam
        xorg.xev # print x event ids
      ];
    };
  };
}
