FROM ubuntu:14.04.3

MAINTAINER jianfeiliao@gmail.com

# Install some common utilities
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:git-core/ppa
RUN apt-get update && \
    apt-get install -y dnsutils curl wget git build-essential zip bc tree cmake openssh-server

# Install Vim with Python modules
ENV TERM xterm-256color
COPY vim-setup/vimrc /root/.config/nvim/init.vim
RUN add-apt-repository -y ppa:neovim-ppa/unstable && \
    apt-get update && \
    apt-get install -y neovim python-dev python-pip && \
    pip install neovim && \
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    ln -s /root/.config/nvim/init.vim /root/.vimrc && \
    nvim +PlugInstall +qall && \
    bash -c /root/.config/nvim/plugged/YouCompleteMe/install.py --gocode-compeleter && \
    update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60 && \
    echo 0 | update-alternatives --config vi

# Install the docker binary
RUN apt-get remove -y docker.io && \
    wget https://get.docker.io/builds/Linux/x86_64/docker-1.8.3 -O /usr/bin/docker && \
    chmod +x /usr/bin/docker

# Install Golang
RUN wget https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz -O /tmp/go.tar.gz && \
    tar -xvf /tmp/go.tar.gz -C /usr/local/ && \
    rm -rf /tmp/go.tar.gz && \
    mkdir /root/go
ENV PATH $PATH:/usr/local/go/bin
ENV GOPATH /host/go

# Setup .bashrc
RUN wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O /root/.git-prompt.sh && \
    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O /root/.git-completion.bash
COPY bashrc /root/.bashrc

ENTRYPOINT bash
