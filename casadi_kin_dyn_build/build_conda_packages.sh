#!/bin/bash

# A simple script to initialize the conda environment
ENVIRONMENT_NAME=kindyn
PACKAGE_NAME=casadi_kin_dyn
UPLOAD=True

if [ '$UPLOAD' = true ]; then
    echo -e "uploading to conda: false";
else
    echo -e "uploading to conda: true";
    conda config --set anaconda_upload yes;
fi

# sourcing base conda path to activate environment
source $(conda info --base)/etc/profile.d/conda.sh
echo -e "activating conda environment: '$ENVIRONMENT_NAME' .." 
conda activate $ENVIRONMENT_NAME
echo -e "done. Current conda environment: '$CONDA_DEFAULT_ENV'"

echo -e "building package $PACKAGE_NAME .." 
cd code/

# building the casadi_kin_dyn package
# using the following command instead of "conda-build" because of error "DependencyNeedsBuildingError: Unsatisfiable dependencies for platform linux-64"
# mamba is just a faster conda
# --token $CONDA_TOKEN
mamba build -c conda-forge $PACKAGE_NAME #--output-folder $CONDA_PREFIX/conda-bld

# installing the package as a conda package
# TAR_FILE_NAME=$(find $CONDA_PREFIX/conda-bld/ -name 'casadi_kin_dyn*.tar.bz2')

# echo -e "installing package: '$TAR_FILE_NAME'"
# conda install $TAR_FILE_NAME

echo -e "done."






