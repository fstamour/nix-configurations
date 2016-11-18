#!/usr/bin/env nix-shell
#! nix-shell -p sbcl lispPackages.quicklisp -i "sh -e"

# Create a variable containing a lisp expression to correctly setup the
# cffi:*foreign-library-directories* special variable.
CFFI_FOREIGN_LIB_DIR=`echo $NIX_LISP_LD_LIBRARY_PATH | sed \
	-re 's/([^:]*)(:|$)/"\1\/" /g'  \
	-e "s/^/\(defparameter cffi::*foreign-library-directories* '\(/"  \
	-e "s/\$/))/" `  

# echo $CFFI_FOREIGN_LIB_DIR

# 1. We must first create the package cffi to be able to set cffi:*foreign-library-directories*.
# 2. We set cffi:*foreign-library-directories*.
# 3. We load quicklisp
# 4. Welcome message (why not)
# 5. Toplevel and user options (see sbcl --help for distinctions)
#    Note, that this way we cannot pass other runtime options
exec sbcl --noinform \
	--eval '(defpackage :cffi)' \
	--eval "${CFFI_FOREIGN_LIB_DIR}" \
	--eval '(load "~/quicklisp/setup.lisp")' \
	--eval '(format t "Welcome~%")' \
	"$@"

