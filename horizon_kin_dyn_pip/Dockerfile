FROM ubuntu:focal-20211006

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y sudo build-essential git pip gdb

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

COPY init_conda_env.sh /home/daniele/
COPY envs/env*.yml /home/daniele/code/

# run a script to activate all the environments added
RUN sudo chmod +x init_conda_env.sh && ./init_conda_env.sh

#COPY modify_ld_library_path.sh /home/daniele/
#RUN sudo chmod +x modify_ld_library_path.sh && ./modify_ld_library_path.sh

# ARG HORIZON_BRANCH='rhc'
# RUN cd code/ git clone https://github.com/ADVRHumanoids/horizon.git -b $HORIZON_BRANCH
ARG TEST_PATH=/home/daniele/code/examples
RUN mkdir $TEST_PATH
COPY /examples/cart_pole_urdf_reader.py $TEST_PATH
COPY /examples/cart_pole.urdf $TEST_PATH