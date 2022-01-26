#!/bin/bash

# DOES NOT WORK (cannot activate a conda environment from here)
# A simple script to initialize the conda environment
ENVIRONMENT_NAME=cs

# sourcing base conda path to activate environment
source $(conda info --base)/etc/profile.d/conda.sh
echo -e "activating conda environment $ENVIRONMENT_NAME .." 
conda activate $ENVIRONMENT_NAME
echo -e "done."

cd ~/code/examples

echo -e "testing casadi .." 
python3 simple_casadi_solve.py
echo -e "success!"

echo -e "testing casadi_kin_dyn .." 
python3 simple_caskindyn_parse.py
echo -e "success!"







