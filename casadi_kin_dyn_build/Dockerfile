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
#RUN conda install mamba -c conda-forge

RUN mkdir ~/code

COPY environment.yml /home/daniele/code
RUN cd ~/code && yes Y | mamba env create -f environment.yml

RUN mkdir /home/daniele/code/casadi_kin_dyn
COPY meta.yaml /home/daniele/code/casadi_kin_dyn
COPY build.sh /home/daniele/code/casadi_kin_dyn
COPY initial_commands.sh /home/daniele/

# needed if I want to build it from a local folder and not from
# COPY casadi_kin_dyn/ /home/daniele/code/casadi_kin_dyn/src/ 

RUN sudo chmod +x initial_commands.sh && ./initial_commands.sh

# add an example for testing
RUN mkdir /home/daniele/code/casadi_kin_dyn/tests
COPY /examples/cart_pole_urdf_reader.py /home/daniele/code/casadi_kin_dyn/tests
COPY /examples/cart_pole.urdf /home/daniele/code/casadi_kin_dyn/tests