#!/bin/bash

#SWIG_VER=`swig -swiglib | sed -e 's|^.*/share/swig/||'`
#export SWIG_LIB=$PREFIX/share/swig/${SWIG_VER}

./configure --prefix=$PREFIX --with-jasper=$PREFIX --enable-python
make -j
make install

# and the install paths are funny - they expect you to add the grib_api
# subdirectory to PYTHONPATH, but that's annoying and non-standard.
cat > $SP_DIR/grib_api/__init__.py <<EOF
import os
import sys
os.environ['GRIB_SAMPLES_PATH']=os.path.join(sys.prefix,'share','grib_api','samples')
os.environ['GRIB_TEMPLATES_PATH']=os.path.join(sys.prefix,'share','grib_api','samples')
os.environ['GRIB_DEFINITION_PATH']=os.path.join(sys.prefix,'share','grib_api','definitions')
EOF
