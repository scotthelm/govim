FROM golang:latest

WORKDIR /vim
RUN apt-get update && \
    apt-get install -y ncurses-dev vim-nox && \
    git clone https://github.com/vim/vim.git && \
    cd vim && \
    ./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr && \
    make VIMRUNTIMEDIR=/usr/share/vim/vim74 && \
    make install

RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

RUN echo 'running'

RUN \
    git clone https://github.com/scotthelm/govim.git /tmp/govim && \
    cp /tmp/govim/.vimrc ~/ && \
    cp /tmp/govim/.bashrc ~/ && \
    cp /tmp/govim/.vimrc_background ~

RUN vim -E -u NONE -S ~/.vimrc +PluginInstall + qa || true
RUN vim -E +GoInstallBinaries + qa || true
RUN mkdir -p /go/src/github.com/scotthelm/

RUN \
    git clone https://github.com/chriskempson/base16-shell.git \
      ~/.config/base16-shell

ENTRYPOINT ["vim"]
