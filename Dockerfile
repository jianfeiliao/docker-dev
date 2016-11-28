FROM ubuntu:14.04

MAINTAINER jianfeiliao@gmail.com

# Common utils
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get install -y dnsutils curl wget git build-essential zip bc tree cmake openssh-server

# Golang
RUN wget https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz -O /tmp/go.tar.gz && \
    tar -xvf /tmp/go.tar.gz -C /usr/local/ && \
    rm -rf /tmp/go.tar.gz && \
    mkdir /root/go
ENV PATH $PATH:/usr/local/go/bin
ENV GOPATH /root/go

# NeoVim
RUN add-apt-repository -y ppa:neovim-ppa/unstable && \
    apt-get update && \
    apt-get install -y neovim python-dev python-pip python3-dev python3-pip && \
    pip2 install --upgrade neovim && \
    pip3 install --upgrade neovim

# Vim Plugins
COPY init.vim /root/.config/nvim/init.vim
RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN nvim +PlugInstall +qa
RUN cd /root/.nvim/plugged/YouCompleteMe && ./install.py --gocode-completer
#RUN nvim +GoInstallBinaries +qa
RUN go get github.com/nsf/gocode && \
    go get github.com/alecthomas/gometalinter && \
    go get golang.org/x/tools/cmd/goimports && \
    go get golang.org/x/tools/cmd/guru && \
    go get golang.org/x/tools/cmd/gorename && \
    go get github.com/golang/lint/golint && \
    go get github.com/rogpeppe/godef && \
    go get github.com/kisielk/errcheck && \
    go get github.com/jstemmer/gotags && \
    go get github.com/klauspost/asmfmt/cmd/asmfmt && \
    go get github.com/fatih/motion && \
    go get github.com/zmb3/gogetdoc && \
    go get github.com/josharian/impl

# Setup .bashrc
#CMD bash
