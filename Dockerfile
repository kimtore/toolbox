FROM ubuntu:20.04
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        dnsutils \
        file \
        git \
        gnupg \
        iproute2 \
        iptables \
        iputils-ping \
        jq \
        less \
        netcat \
        nmap \
        rsync \
        ssh \
        socat \
        tcpdump \
        tmux \
        traceroute \
        vim \
        wget \
        zsh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN wget -O /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/3.4.1/yq_linux_amd64 && chmod +x /usr/local/bin/yq
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
    && apt-get update -y \
    && apt-get install google-cloud-sdk -y
WORKDIR /root
RUN git clone https://github.com/ambientsound/dotfiles && /root/dotfiles/setup
RUN chsh -s /bin/zsh
CMD ["/bin/sleep", "infinity"]
