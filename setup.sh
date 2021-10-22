RUN export SHELL=`which zsh`
RUN [ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
