FROM ubuntu:18.04
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        dnsutils \
        git \
        iputils-ping \
        iproute2 \
        netcat \
        nmap \
        socat \
        tmux \
        traceroute \
        vim \
        wget \
        zsh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /root
RUN git clone https://github.com/ambientsound/dotfiles && /root/dotfiles/setup
RUN chsh -s /bin/zsh
CMD ["/bin/zsh"]
