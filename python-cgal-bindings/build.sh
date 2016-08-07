#!/bin/bash

# ugly hack - not sure how to get around this
SWIG_VER=`swig -swiglib | sed -e 's|^.*/share/swig/||'`
export SWIG_LIB=$PREFIX/share/swig/${SWIG_VER}
if [ "$(uname)" == "Linux" ]; then
  cmake -DBUILD_JAVA=OFF -DSWIG_DIR=$SYS_PREFIX -DCMAKE_INSTALL_PREFIX=$PREFIX '-DCMAKE_INSTALL_RPATH=$ORIGIN/../lib' .
fi
if [ "$(uname)" == "Darwin" ]; then
  cmake -DBUILD_JAVA=OFF -DSWIG_DIR=$SYS_PREFIX -DCMAKE_INSTALL_PREFIX=$PREFIX '-DCMAKE_INSTALL_RPATH=@loader_path/../lib' .
fi
# on wakari, don't use -j b/c of RAM constraints
make -j2
cp -av build-python/CGAL $SP_DIR/CGAL
cp -av lib/* $PREFIX/lib
