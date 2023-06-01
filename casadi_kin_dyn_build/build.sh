# specify install location
# 1. pybind, otherwise it installs using python 3.9
# 2. install in conda

echo -e "$CONDA_PREFIX"

CMAKE_FLAGS="-DPYBIND11_PYTHON_VERSION=3.8 \
             -DCMAKE_INSTALL_PREFIX=$CONDA_PREFIX -DCMAKE_PREFIX_PATH=$CONDA_PREFIX"

# Build in subdirectory
mkdir build
cd build
cmake .. $CMAKE_FLAGS
make -j4
make install
