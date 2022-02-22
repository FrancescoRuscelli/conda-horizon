#!/bin/bash

# DOES NOT WORK (cannot activate a conda environment from here)
# A simple script to initialize the conda environment
ENVIRONMENT_NAME=hori
PACKAGE_NAME=horizon
UPLOAD=True

if [ '$UPLOAD' = true ]; then
    echo "Not uploading to conda";
else
    conda config --set anaconda_upload yes;
fi

# sourcing base conda path to activate environment
source $(conda info --base)/etc/profile.d/conda.sh
echo -e "activating conda environment $ENVIRONMENT_NAME .." 
conda activate $ENVIRONMENT_NAME
echo -e "done."

echo -e "building package $PACKAGE_NAME .." 
cd code/

# building the casadi_kin_dyn package
# using the following command instead of "conda-build" because of error "DependencyNeedsBuildingError: Unsatisfiable dependencies for platform linux-64"
conda build -c conda-forge -c francesco_ruscelli -c robostack $PACKAGE_NAME

echo -e "done."


#conda install $CONDA_PREFIX/conda-bld/noarch/horizon...







