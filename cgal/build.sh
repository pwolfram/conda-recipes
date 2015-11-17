#!/bin/bash

# setting GMP_LIBRARIES with the full -L<path> -lgmp
# was necessary on OSX/clang.  Not sure if it somehow worked on linux
# with just the path
# had been using SYS_PREFIX, but PREFIX is probably more appropriate since
# having gmp as a requirement will install it to PREFIX, not SYS_PREFIX
cmake -DGMP_LIBRARIES="-L$PREFIX/lib -lgmp" -DGMP_INCLUDE_DIR=$PREFIX/include -DCMAKE_INSTALL_PREFIX=$PREFIX '-DCMAKE_INSTALL_RPATH=$ORIGIN/../lib' .
make 
make install
