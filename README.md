# Horizon CONDA

This repo contains the steps to generate two packages specifically for conda:
- **casadi_kin_dyn**
- **horizon**

The packages are built in a minimal docker environment, to maximize predictability.

- The **_build* folder builds the package and allows to upload it on the anaconda site.
- The **_download* folder downloads the last version of the package found in the site.

Both contain minimal examples to test if the build or the installation are excuted succesfully.