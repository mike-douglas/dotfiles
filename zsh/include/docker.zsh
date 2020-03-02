alias ascii2gif="docker_command asciinema/asciicast2gif /data -t solarized-dark"

# Dry is a nice docker CLI tool
alias dry="docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_HOST=$DOCKER_HOST moncho/dry"
