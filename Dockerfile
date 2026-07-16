# syntax=docker/dockerfile:1

FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV RUSTUP_HOME=/usr/local/rustup
ENV CARGO_HOME=/usr/local/cargo
ENV PATH=/usr/local/cargo/bin:${PATH}

# for rust GUI grafics
#  xwayland
# for miniquad (rust 2D framework)
#  libxkbcommon-dev
#  libxkbcommon-x11-0
#  libxi-dev
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    wget \
    unzip \
    git \
    gosu \
    sudo \
    gh \
    lsd \
    bat \
    neovim \
    just \
    build-essential \
    pkg-config \
    libssl-dev \
    xwayland \
    bash-completion \
    libxkbcommon-dev libxkbcommon-x11-0 \
    libxi-dev \
 && rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path --default-toolchain stable && \
    rustup update stable && \
    rustup default stable && \
    rustup component add rustfmt

RUN cargo install --locked --root /usr/local cargo-audit --version 0.21.1

RUN mkdir -p /etc/sudoers.d/
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ubuntu

# Install Oh My Posh
RUN wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
RUN chmod +x /usr/local/bin/oh-my-posh
# Install Oh My Posh theme
RUN mkdir -p /home/ubuntu/.poshthemes
RUN wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O /home/ubuntu/.poshthemes/themes.zip
RUN unzip /home/ubuntu/.poshthemes/themes.zip -d /home/ubuntu/.poshthemes
RUN echo 'eval \"$(oh-my-posh init bash --config ~/.poshthemes/blueish.omp.json)\"' >> /home/ubuntu/.bashrc
RUN rm -rf /home/ubuntu/.poshthemes/themes.zip
WORKDIR /workdir

RUN ln -s /usr/bin/lsd /usr/local/bin/ls
RUN ln -s /usr/bin/batcat /usr/local/bin/cat


COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash"]

