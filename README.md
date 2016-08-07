# govim

This repo contains a Dockerfile and supporting files for creating a docker image
that

* Has the latest Go version
* Has the Vim editor with a small set of vim plugins including
    - fatih/vim-go
    - surround
    - syntastic
    - nerdtree

This repo also contains an ailas you can use in your `.bashrc` or `.zshrc` for
invoking the container and mounting your current directory under the default
gopath within it.


```
alias govim='
  docker run \
    -it \
    --rm \
    -v $(pwd):$(pwd) \
    -w $(pwd) \
    -v $HOME/.docker:/root/.docker:ro \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e "DOCKER_HOST_URL=$DOCKER_HOST" \
    scotthelm/govim'
```
