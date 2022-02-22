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

COPY environment.yml /home/daniele/code
RUN cd ~/code && yes Y | mamba env create -f environment.yml

#COPY modify_ld_library_path.sh /home/daniele/
#RUN sudo chmod +x modify_ld_library_path.sh && ./modify_ld_library_path.sh

RUN mkdir /home/daniele/code/horizon
COPY meta.yaml /home/daniele/code/horizon
COPY initial_commands.sh /home/daniele/

ARG USER=ADVRHumanoids
ARG REPO=horizon
ARG BRANCH=devel
ADD https://api.github.com/repos/$USER/$REPO/git/refs/heads/$BRANCH version.json
RUN sudo chmod +x initial_commands.sh && ./initial_commands.sh
