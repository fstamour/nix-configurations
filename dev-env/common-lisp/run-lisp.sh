#!/usr/bin/env nix-shell
#! nix-shell -p rlwrap lispPackages.quicklisp -i "sh -e -- $@"

rlwrap quicklisp run -- $@

