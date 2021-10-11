FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

COPY ./scripts/* /usr/local/bin/

RUN apt-get -y update && apt-get install -y \
ca-certificates \
    tzdata \
    git \
    build-essential \
    autoconf \
    autotools-dev \
    automake \
    dnsutils \
    vim \
    nano \
    less \
    lsof \
    inetutils-ping \
    inetutils-telnet \
    curl \
    wget \
    ruby \
    python \
    python3 \
    python3-distutils-extra \
    gdb \
    netcat \
    ncat \
    socat && \
    mkdir /share && cd /tmp && \
    gem install rex-text && \
    curl -skL https://bootstrap.pypa.io/pip/2.7/get-pip.py | python2 && \
    curl -skL https://bootstrap.pypa.io/get-pip.py | python3 && \
    python2 -m pip install --upgrade pip && \
    python3 -m pip install --upgrade pip && \
    git clone https://github.com/longld/peda.git /root/peda && \
    echo "source ~/peda/peda.py" >> /root/.gdbinit && \
    python2 -m pip install pwntools && \
    python3 -m pip install pwntools && \
    python2 -m pip install ropper && \
    python3 -m pip install ropper && \
    curl -skLo /usr/local/bin/aslr https://raw.githubusercontent.com/phx/aslr/master/aslr && \
    chmod +x /usr/local/bin/aslr && \
    git clone https://github.com/phx/lilendian && \
    cd lilendian && \
    python2 setup.py install && \
    python3 -m pip install lilendian && \
    cd /tmp && \
    rm -rf lilendian && \
    curl -skLo /usr/local/bin/pattern_create.rb https://raw.githubusercontent.com/rapid7/metasploit-framework/master/tools/exploit/pattern_create.rb &&\
    curl -skLo /usr/local/bin/pattern_offset.rb https://raw.githubusercontent.com/rapid7/metasploit-framework/master/tools/exploit/pattern_offset.rb &&\    
    chmod +x /usr/local/bin/pattern_create.rb && \
    chmod +x /usr/local/bin/pattern_offset.rb && \
    mkdir /root/git && \
    cd /root/git && \
    git clone https://github.com/niklasb/libc-database && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get clean

