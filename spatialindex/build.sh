#cd src
#./configure --prefix=$PREFIX
cmake -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX
make all install
