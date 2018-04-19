FROM erroneousboat/neovim

WORKDIR /root

ENTRYPOINT []

RUN apt-get update && apt-get install -y tmux curl git

COPY nvim.vim /root/.config/nvim/init.vim
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN nvim +PlugInstall +q > /dev/null
