# See here for image contents: https://github.com/jeandeaual/docker-lilypond/blob/master/Dockerfile

# [Choice] LilyPond version: 2.18.2, 2.20.0, 2.21.7, etc.
ARG VARIANT="2.20.0"
FROM jeandeaual/lilypond:${VARIANT}

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y upgrade \
    && apt-get -y install sudo git \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid "${USER_GID}" "${USERNAME}"
RUN useradd -s /bin/bash --uid "${USER_UID}" --gid "${USER_GID}" --groups sudo --create-home "${USERNAME}"
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers