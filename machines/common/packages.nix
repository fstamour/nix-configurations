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
    moreutils # sponge, ts, etc
    rlwrap # readline wrapper
    screen # terminal multiplexer
    tig # text-mode interface for git
    tmux # terminal multiplexer
    tree # list files
    unzip
    vim # editor
    w3m # terminal web browser
    wget # alternative to curl
    zip
  ] ++ [
    # Editors
    emacs
    kakoune # alternative to vim
    vim
  ] ++ [
    # TODO Move to a nono-cmooon file
    # Specific to "mu"
    refind # efi boot loader
  ] ++ [
    # Inspection and diagnotic tools
    bind # e.g. nslookup
  ] ++ [
    # fancy command line tools
    bat # show files
    fd # alternative to "find"
    fzf # fuzzy finder
    pv # pipe viewer
    ranger # file explorer
    ripgrep # find in files
    rlwrap # for shell that doesn't have readline (e.g. sbcl)
    taskwarrior # todo manager
  ] ++ [
    # Inspection and diagnotic tools
    bind # e.g. nslookup
    htop # process viewer
    iotop
    lsof # to find which process has which file opened
    pv # pipe viewer, useful with dd
    usbutils # e.g. list usb devices
  ] ++ [
    # Windows interop
    ntfs3g # In order to mount NTFS with rw
  ] ++ [
    # Spell checker and dictionaries
    hunspell
    hunspellDicts.fr-moderne
    hunspellDicts.fr-any
    hunspellDicts.en-gb-ize
    hunspellDicts.en-us
    hunspellDicts.es-cu
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
