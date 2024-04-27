# Use the official Ubuntu image as the base image
FROM ubuntu:20.04

# Install Neovim, required packages, and build essentials
RUN apt-get update && \
    apt-get install -y curl python3 python3-pip build-essential libfuse2 git cscope ctags global && \
    pip3 install pynvim

# Set the shell to bash
SHELL ["/bin/bash", "-c"]

# Setup neovim
RUN mkdir -p ~/.config/nvim && mkdir -p ~/.config/nvim/indent \
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && \
    chmod u+x nvim.appimage && mkdir -p /opt/nvim && mv nvim.appimage /opt/nvim/nvim

ENV PATH="$PATH:/opt/nvim/"

# Setup vim-plug so that init.vim works
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy bashrc
COPY bashrc /root/.bashrc

# Set up Neovim configuration
COPY vimrc /root/.vim/.vimrc
COPY init.vim /root/.config/nvim/init.vim 
COPY cpp.vim ~/.config/nvim/indent/cpp.vim
COPY clang-format.py /sbin/clang-format.py

# Setup nodejs which is needed for auto completion engines.
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
	    apt-get install -y nodejs zip

# Set the entrypoint to Neovim
ENTRYPOINT ["nvim"]

