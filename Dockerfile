FROM golang:1.8

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

COPY .* /root/
ENV LC_ALL=C.UTF-8

RUN \
    git clone https://github.com/gmarik/Vundle.vim.git \
        ~/.vim/bundle/Vundle.vim && \
    vim -E -u NONE -S ~/.vimrc +PluginInstall +GoInstallBinaries +qa\
        || true && \
    mkdir -p /go/src/github.com/scotthelm/ && \
    git clone https://github.com/chriskempson/base16-shell.git \
      ~/.config/base16-shell

CMD /usr/bin/vim
