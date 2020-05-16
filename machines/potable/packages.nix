{ config, pkgs, ... }:

{
# List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # Basic utilities
    bat # file viewer
    fd # alternative to "find"
    file # determine file type
    fish # friendly shell
    fzf # fuzzy finder
    gitAndTools.gitFull
    htop # process viewer
    moreutils # sponge, ts, etc
    pv # pipe viewer
    ranger # file explorer
    ripgrep # find in file
    rlwrap # for shell that doesn't have readline (e.g. sbcl)
    screen # terminal multiplexer
    tig # text-mode interface for git
    tmux # terminal multiplexer
    tree # ls in tree-like format
    unzip
    w3m # terminal web browser
    wget # download stuff
  ] ++ [
    # Editors
    emacs
    kakoune # alternative to vim
    vim
  ] ++ [
    # Specific to "mu"
    refind
  ] ++ [
    # Inspection and diagnotic tools
    bind # e.g. nslookup
    htop
    iotop
    lsof # to find which process has which file opened
    pv # pipe viewer, useful with dd
    usbutils # e.g. list usb devices
  ] ++ [
    # Windows interop
    ntfs3g # In order to mount NTFS with rw
  ];
}
