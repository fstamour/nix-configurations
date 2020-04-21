{ config, pkgs, ... }:

{
# List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # Basic utilities
    emacs
    file
    fish
    gitAndTools.gitFull
    moreutils # Sponge at least...
    rlwrap
    screen
    tmux
    tree
    vim
    w3m
    wget
  ] ++ [
    # Specific to "mu"
    refind
  ] ++ [
    # fancy command line tools
    bat
    tmux
    ranger
    fd
    fzf
    ripgrep
  ] ++ [
    # Inspection tools
    lsof
    iotop
    htop
    pv
  ];
}
