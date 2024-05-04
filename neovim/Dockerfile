# Use the official Ubuntu image as the base image
FROM ubuntu:22.04

# Install Neovim, required packages, and build essentials
RUN apt-get update && \
    apt-get install -y curl python3 python3-pip build-essential fuse git cscope exuberant-ctags global sudo && \
    pip3 install pynvim

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

# Setup neovim
RUN mkdir -p /home/$USER/.config/nvim && mkdir -p /home/$USER/.config/nvim/indent /home/$USER/.vim && \
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && \
    chmod u+x nvim.appimage && mkdir -p /home/$USER/opt/nvim && mv nvim.appimage /home/$USER/opt/nvim/nvim

ENV PATH="$PATH:/home/${USER}/opt/nvim/"

# Setup vim-plug so that init.vim works
RUN curl -fLo /home/$USER/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy bashrc
COPY bashrc /home/$USER/.bashrc

# Set up Neovim configuration
COPY vimrc /home/$USER/.vimrc
COPY init.vim /home/$USER/.config/nvim/init.vim 
COPY cpp.vim /home/$USER/.config/nvim/indent/cpp.vim
COPY clang-format.py /sbin/clang-format.py

# Setup nodejs which is needed for auto completion engines.
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
RUN sudo apt-get install -y nodejs zip universal-ctags

# Set the entrypoint to Neovim
ENTRYPOINT ["nvim"]

