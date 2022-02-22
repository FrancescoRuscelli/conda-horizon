#!/bin/bash

# DOES NOT WORK (cannot activate a conda environment from here)
# A simple script to initialize the conda environment
ENVIRONMENT_NAME=hori

# sourcing base conda path to activate environment
source $(conda info --base)/etc/profile.d/conda.sh
echo -e "activating conda environment $ENVIRONMENT_NAME .." 
conda activate $ENVIRONMENT_NAME
echo -e "done."

cd $CONDA_PREFIX

mkdir -p ./etc/conda/activate.d
mkdir -p ./etc/conda/deactivate.d
touch ./etc/conda/activate.d/env_vars.sh
touch ./etc/conda/deactivate.d/env_vars.sh

echo "export OLD_LD_LIBRARY_PATH=${LD_LIBRARY_PATH}" >> ./etc/conda/activate.d/env_vars.sh
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${CONDA_PREFIX}/lib" >> ./etc/conda/activate.d/env_vars.sh

echo "export LD_LIBRARY_PATH=${OLD_LD_LIBRARY_PATH}" >> ./etc/conda/deactivate.d/env_vars.sh
echo "unset OLD_LD_LIBRARY_PATH" >> ./etc/conda/deactivate.d/env_vars.sh



