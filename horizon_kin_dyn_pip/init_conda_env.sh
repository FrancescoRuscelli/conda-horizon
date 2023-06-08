#!/bin/bash

# loop all the environment recipes and create them
for file in /home/daniele/code/env*.yml; do
    echo "Creating conda environment with recipe: $file"
    cd ~/code && yes Y | mamba env create -f $file
done