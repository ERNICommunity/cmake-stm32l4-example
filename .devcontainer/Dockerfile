FROM ubuntu:20.04 AS base
ENV DEBIAN_FRONTEND=noninteractive
#Install C++ tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    wget \
    python3-pip \
    cmake \
    ninja-build \
    llvm \
    # Needed by gcc-arm-none-eabi-gdb
    libncurses5
# Install GCOVR and update to newest version
RUN pip3 install gcovr && pip3 install -U gcovr 
# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog
#
#
#
#VS-Code Build Environment
FROM base AS vscodeenv
ENV DEBIAN_FRONTEND=noninteractive
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
#Install specific devtools
RUN apt-get update && apt-get install --no-install-recommends -y \
    vim \
    sudo \
    git-core \
    gdb \
    ssh
# Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME 
# Add sudo support for the non-root user
RUN apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    && chmod 0440 /etc/sudoers.d/$USERNAME 
# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# pull the gcc-arm-none-eabi tarball
WORKDIR /work
RUN wget -qO- 'https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2' | tar -xj
ENV PATH $PATH:/work/gcc-arm-none-eabi-9-2019-q4-major/bin

# pull the gcc-arm-linux-gnueabihf tarball
WORKDIR /work
RUN wget -qO- 'https://sourceforge.net/projects/raspberry-pi-cross-compilers/files/Raspberry%20Pi%20GCC%20Cross-Compiler%20Toolchains/Buster/GCC%2010.2.0/Raspberry%20Pi%201%2C%20Zero/cross-gcc-10.2.0-pi_0-1.tar.gz' | tar -xz
ENV PATH $PATH:/work/cross-pi-gcc-10.2.0-0/bin

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog