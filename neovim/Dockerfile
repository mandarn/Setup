# Use the official Ubuntu image as the base image
FROM ubuntu:20.04

# Install Neovim, required packages, and build essentials
RUN apt-get update && \
    apt-get install -y curl python3 python3-pip build-essential libfuse2 git cscope ctags global ripgrep fd-find && \
    pip3 install pynvim

# Set the shell to bash
SHELL ["/bin/bash", "-c"]

# Setup neovim
RUN mkdir -p ~/.config/nvim && \
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

# Setup nodejs which is needed for auto completion engines.
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
	    apt-get install -y nodejs zip

# Set the entrypoint to Neovim
ENTRYPOINT ["nvim"]

