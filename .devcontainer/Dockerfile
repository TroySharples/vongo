FROM ubuntu:latest

# Install APT packages
RUN apt update -yqq && apt upgrade -yqq \
    && DEBIAN_FRONTEND=noninteractive apt install -yqq sudo build-essential git ghdl python3 python3-pip gtkwave

# Install PIP packages
RUN pip install cocotb vunit-hdl

# Add a non-root user
ARG USERNAME
RUN groupadd --gid 1000 $USERNAME \
    && useradd --uid 1000 --gid 1000 -s /bin/bash -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
USER $USERNAME