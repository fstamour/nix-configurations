{ config, pkgs, ... }:

{
# List packages installed in system profile.
  environment.systemPackages = with pkgs; [

    ### Basic utilities
    bc # basic calculator
    colordiff # diff, with colors!!
    dos2unix # end-of-line converter
    file # determine file type
    fish # friendly interactive shell
    gitAndTools.gitFull
    moreutils # sponge, ts, etc
    rlwrap # readline wrapper
    screen # terminal multiplexer
    tig # text-mode interface for git
    tmux # terminal multiplexer
    tree # list files
    zip unzip
    w3m # terminal web browser
    wget # alternative to curl
    unixtools.xxd # hex viewer (and more)

    ### Editor
    emacs

    ### fancy command line tools
    bat # show files
    entr # file watcher
    fd # alternative to "find"
    fzf # fuzzy finder
    jq # cli JSON processor
    pv # pipe viewer
    ranger # file explorer
    ripgrep # find in files
    rlwrap # for shell that doesn't have readline (e.g. sbcl)
    taskwarrior # todo manager

    ### Inspection and diagnotic tools
    bind # e.g. nslookup
    htop # process viewer
    iotop
    lsof # to find which process has which file opened
    nmap # network discovery and security auditing
    pciutils # for lspci (to list PCI cards)
    pv # pipe viewer, useful with dd
    usbutils # e.g. list usb devices

    ### File system
    ntfs3g # In order to mount NTFS with rw
    exfat
    gptfdisk

    ### Admin stuff
    borgbackup

    ### Spell checker and dictionaries
    hunspell
    hunspellDicts.fr-moderne
    hunspellDicts.fr-any
    hunspellDicts.en-gb-ize
    hunspellDicts.en-us
    hunspellDicts.es-cu
    # dictionnary, thesaurus and more. commands: wn and wnb
    wordnet

    ### machine learning
    # octave
    # tesseract
    # weka # Collection of machine learning algorithms for data mining tasks
    # autoweka?

    ### constraint programming
    #minizinc
    #gecode

    ### formal methods
    #tlaplusToolbox
    #tetex # for pretty-printing TLA specs

    ### clojure
    # boot
    # clojure

    ### rust
    # cargo

    ### javascript
    # nodejs

    ### lisp
    # abcl
    # ccl
    # clasp
    # ecl
    # sbcl
    # cl-launch
    # lispPackages.quicklisp


    ### general
    # gnumake
    # gdb
    # ctags
    # cmake

    ### multimedia
    youtube-dl # download stuff from youtube
    #imagemagick
    #sox # swiss-army knife for audio
    #handbrake
    ffmpeg

    ### CAD and media authoring
    #audacity #  Sound editor with graphical UI
    #blender
    #freecad
    kicad
    inkscape
    gimp
    #gifsicle # cli for gifs
  ];
}
