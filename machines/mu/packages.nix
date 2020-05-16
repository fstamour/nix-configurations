{ config, pkgs, ... }:

{
# List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # Basic utilities
    bc # basic calculator
    emacs # mini-os
    file # determine file type
    fish # friendly interactive shell
    gitAndTools.gitFull
    moreutils # Sponge at least...
    rlwrap # readline wrapper
    screen # terminal multiplexer
    tmux # terminal multiplexer
    tree # list files
    unzip
    vim # editor
    w3m # terminal web browser
    wget # alternative to curl
    zip
  ] ++ [
    # Specific to "mu"
    refind # efi boot loader
  ] ++ [
    # fancy command line tools
    bat # show files
    ranger # file explorer
    fd # file finder
    fzf # fuzzy finder
    ripgrep # find in files
    taskwarrior # todo manager
  ] ++ [
    # Inspection tools
    lsof 
    iotop
    htop
    pv
  ] ++ [
    # Spell checker and dictionaries
    hunspell
    # hunspellDicts.fr-moderne-dicollecte
    # hunspellDicts.fr-any-dicollecte
    # hunspellDicts.en-gb-ize-wordlist
    # hunspellDicts.es-cu-rla

    hunspellDicts.fr-moderne
    hunspellDicts.fr-any
    hunspellDicts.en-gb-ize
    hunspellDicts.en-us
    hunspellDicts.es-cu
  ] ++ [
    # machine learning
    octave # on 19.09, it requires the qscintilla package which is markedd as broken
    tesseract

    # constaint programming
    minizinc
    gecode

    # formal methods
    tlaplusToolbox
    tetex # for pretty-printing TLA specs
    
    # clojure
    boot
    clojure

    # rust
    cargo

    # javascript
    nodejs

    # lisp
    abcl
    ecl
    ccl
    sbcl

    # general
    gnumake
    gdb
    ctags
    cmake
    youtube-dl # download stuff from youtube
  ];
}
