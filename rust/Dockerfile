FROM ubuntu:22.04

# Install essential tools
RUN apt-get update && \
    apt-get install -y build-essential cmake vim curl git cscope clang-format \
    python3 python3-pip python3-dev wget fuse exuberant-ctags global sudo

# Get the UID and GID in args
ARG UID
ARG GID
ARG USER

# Set the shell to bash
SHELL ["/bin/bash", "-c"]

# Add $USER
RUN addgroup --gid $GID $USER && \
    adduser --uid $UID --gid $GID --disabled-password --gecos "" $USER && \
    echo $USER ALL=\(ALL\) NOPASSWD: ALL >> /etc/sudoers

# Set the $USER as default user
USER $USER

# Set the working directory
WORKDIR /home/$USER

# Chown the whole home directory
RUN chown -R $USER:$USER /home/$USER

# Install rust
RUN sudo curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sudo sh -s -- -y

# Install Vim plugins (YouCompleteMe)
RUN git clone https://github.com/ycm-core/YouCompleteMe.git /home/$USER/.vim/bundle/YouCompleteMe && \
    cd /home/$USER/.vim/bundle/YouCompleteMe && \
    git submodule update --init --recursive && \
    python3 install.py --clangd-completer --rust-completer

# Copy local vimrc to root
COPY .vimrc /home/$USER/

# .ycm_extra_conf.py
RUN curl -fLo ~/.ycm_extra_conf.py \
    https://raw.githubusercontent.com/HmyBmny/vimrc/master/ycm_extra_conf.py

# plug.vim
RUN curl --insecure -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins manually
# vim +PlugInstall

# Set the entry point (you can customize this)
CMD ["vim"]
