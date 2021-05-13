# See here for image contents: https://github.com/jeandeaual/docker-lilypond/blob/master/Dockerfile

# [Choice] LilyPond version: 2.22.0, 2.23.0, etc.
ARG VARIANT="2.22.0"
FROM jeandeaual/lilypond:${VARIANT}

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y upgrade \
    && apt-get -y --no-install-recommends install sudo git vim timidity fluid-soundfont-gm fluid-soundfont-gs \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid "${USER_GID}" "${USERNAME}"
RUN useradd -s /bin/bash --uid "${USER_UID}" --gid "${USER_GID}" --groups sudo --create-home "${USERNAME}"
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN printf '\nexport LANG="C"\nexport LANGUAGE="C"\nexport LC_ALL="C"\n' >> "/home/${USERNAME}/.bashrc"
