
# Quicklisp

Quicklisp can be installed as an executable (a shell script)
```shell
nix-env -i lisp-quicklisp
```

Or installed temporarly in a nix-shell
```shell
nix-shell -p lispPackages.quicklisp
```

It is then called like that:
```shell
quicklisp {init, install, run, update}
```

I think it also support a `--quicklisp-directory` parameter, that I havn't tested.

# CFFI

Some packages uses C libraries (via the CFFI), but for cffi to find the `*.so` files it must know where to look. Fortunatly, nix set a environment variable containing the appropriate list of path `NIX_LISP_LD_LIBRARY_PATH`.
One should set the (lisp) variable `cffi:*foreign-library-directories*` to math the (environment) variable `NIX_LISP_LD_LIBRARY_PATH`.

# Putting it all together

See `./run-lisp` for an example of how one could open a "full-fledged" repl.

