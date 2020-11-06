# See here for image contents: https://github.com/jeandeaual/docker-lilypond/blob/master/Dockerfile

# [Choice] LilyPond version: 2.18, 2.20, 2.21.7, etc.
ARG VARIANT="2.20"
FROM jeandeaual/lilypond:${VARIANT}

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid "${USER_GID}" "${USERNAME}"
RUN useradd -s /bin/bash --uid "${USER_UID}" --gid "${USER_GID}" -m "${USERNAME}"

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y upgrade \
    && apt-get -y install sudo git \
    && rm -rf /var/lib/apt/lists/*
