#!/bin/sh 

exec nix-shell -p sbcl --command "/bin/sh -c \"(sed -ne '/^exec/{s///; :a' -e 'n;p;ba' -e '}' $0 && cat) | /bin/sh \""

export SBCL_HOME=$(readlink -f $(which sbcl)/../lib/sbcl)
sbcl --eval "(ql:quickload :swank)"

