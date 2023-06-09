FROM ubuntu:focal-20211006
RUN apt-get update && apt-get install -y sudo build-essential git pip

# add user with sudo privileges which is not prompted for password
RUN adduser --disabled-password --gecos '' daniele
RUN adduser daniele sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER daniele

WORKDIR /home/daniele
RUN sudo apt-get update
RUN sudo apt-get -y upgrade
RUN sudo apt-get install -y curl
RUN curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh
RUN printf '\nyes\n\nyes\n' | bash Mambaforge-$(uname)-$(uname -m).sh

# this is required to find conda
ENV PATH /home/daniele/mambaforge/bin:$PATH

# copy all the environments found (referring to different python versions) 
COPY init_conda_env.sh /home/daniele/
COPY environment.yml /home/daniele/code/

# run a script to activate all the environments added
# RUN sudo chmod +x init_conda_env.sh && ./init_conda_env.sh
RUN cd ~/code && yes Y | mamba env create -f environment.yml

# add an example for testing
RUN sudo mkdir /home/daniele/code/examples
COPY /examples/cart_pole_urdf_reader.py /home/daniele/code/examples
COPY /examples/cart_pole.urdf /home/daniele/code/examples
