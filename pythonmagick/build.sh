#!/bin/bash -eu

#git describe --tags --dirty | sed -r 's/-/.post/' | sed -r 's/-/./g' > $SRC_DIR/__conda_version__.txt
./configure --help

./configure --prefix=$PREFIX
make
make install
