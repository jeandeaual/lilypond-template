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

# https://github.com/lhl2617/VSLilyPond/blob/master/docs/INSTALL.md#python-ly-setup-guide-required-for-formatting
RUN python -m pip install python-ly

RUN groupadd --gid "${USER_GID}" "${USERNAME}"
RUN useradd -s /bin/bash --uid "${USER_UID}" --gid "${USER_GID}" --groups sudo --create-home "${USERNAME}"
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN printf '\nexport LANG="C"\nexport LANGUAGE="C"\nexport LC_ALL="C"\n' >> "/home/${USERNAME}/.bashrc"
# Use python-ly installed previously instead of the one bundled with VSLilyPond
RUN printf '{\n    "lilypondFormatter.general.useBundledPythonLy": false\n}\n' >> "/home/${USERNAME}/.vscode-server/data/Machine/settings.json"
