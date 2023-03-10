FROM debian:stable-20221219-slim
LABEL maintainer="Chi Cuong Le <chicuongle@protonmail.com>"
LABEL description="A basic image for all development environments. This image includes useful linux packages for development in general."

ARG user
ARG password
ARG email

RUN apt-get update\
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y curl unzip zip vim wget screen less sudo libxml2-utils git git-flow zsh\
    # add default user
    && useradd -ms /bin/bash $user && echo "$user:$password" | chpasswd && adduser $user sudo \
    && echo "$user   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    # Clean up APT when done.
    && apt-get clean 
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER $user

RUN echo "alias ll='ls -l'" >> $HOME/.bashrc\
    && git config --global user.email $email\
    && git config --global user.name $user\
    && git config --global push.default simple

WORKDIR /workspaces
