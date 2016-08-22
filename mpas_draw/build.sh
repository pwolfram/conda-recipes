#!/bin/bash

# setting GMP_LIBRARIES with the full -L<path> -lgmp
# was necessary on OSX/clang.  Not sure if it somehow worked on linux
# with just the path
# had been using SYS_PREFIX, but PREFIX is probably more appropriate since
# having gmp as a requirement will install it to PREFIX, not SYS_PREFIX
#module purge
#module load gcc openmpi cmake
#module list
cd visualization/mpas_draw/
export LIBGL_ALWAYS_SOFTWARE=1
#g++ mpas_draw.cpp vec_utils.cpp netcdf_utils.cpp -lGL -lglut -lnetcdf_c++ -lnetcdf -lGLU -lstdc++ -O3 -m64  -D_LINUX -o MpasDraw.x
g++ mpas_draw.cpp vec_utils.cpp netcdf_utils.cpp -lMesaglut -lMesaGLU -lMesaGL -lnetcdf_c++ -lnetcdf -lstdc++ -O3 -m64  -D_LINUX -o MpasDraw.x
#g++ mpas_draw.cpp vec_utils.cpp netcdf_utils.cpp  -lOSMesa -lglut -lMesaGLU -lMesaGL -lnetcdf_c++ -lnetcdf -lstdc++ -O3 -m64  -D_LINUX -o MpasDraw.x
#g++ mpas_draw.cpp vec_utils.cpp netcdf_utils.cpp  -lOSMesa  -lGLU -lglut -lnetcdf_c++ -lnetcdf -lstdc++ -O3 -m64  -D_LINUX -o MpasDraw.x
cp MpasDraw.x $PREFIX/bin/
