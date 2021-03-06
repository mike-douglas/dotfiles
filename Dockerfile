FROM zshusers/zsh:latest

RUN apt-get -y update && apt-get install -y git python3-pip sudo
RUN mkdir -p /root/.home

VOLUME ["/root/.home"]
ENTRYPOINT ["/usr/bin/zsh"]