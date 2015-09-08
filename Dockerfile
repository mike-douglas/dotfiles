FROM jess/zsh:latest

RUN apt-get -y update && apt-get install -y git python-pip sudo
RUN mkdir -p /root/.home

VOLUME ["/root/.home"]
ENTRYPOINT ["/bin/zsh"]