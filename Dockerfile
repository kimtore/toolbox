FROM ubuntu:18.04
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        file \
        git \
        iputils-ping \
        iptables \
        less \
        nmap \
        tcpdump \
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
