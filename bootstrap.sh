sudo apt-get update
# Install postgresql cli 
# install postgresql common and client
function install_pg
{
    echo "Postgresql installation: True"
    echo "installing postgresql..."
    sudo apt-get install postgresql-client-common && \
        sudo apt-get install postgresql-client
}

# Install python dependencies
function install_python_dep
{
    echo "Python installation: True"
    echo "installing Python..." 
    sudo apt-get install python-dev && \
        sudo apt-get install libffi-dev
}


# Docker installation 
function install_docker
{
    echo "Docker installation: True"
    echo "installing docker...."
    wget -qO- https://get.docker.com/ | sudo sh
}

# Install docker-compose
function install_docker_compose
{
    echo "Docker Compose installation: True"
    echo "installing docker compose...."
    COMPOSE_VERSION=`git ls-remote https://github.com/docker/compose | grep refs/tags | grep -oP "[0-9]+\.[0-9]+\.[0-9]+$" | tail -n 1`
    sudo sh -c "curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
    sudo chmod +x /usr/local/bin/docker-compose
    sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"
}

if [ $1 == 'true' ]; then install_python_dep; fi
if [ $2  == 'true' ]; then install_pg; fi
if [ $3 == 'true' ]; then install_docker; fi
if [ $4 == 'true' ]; then install_docker_compose; fi

# Add current user to group
sudo usermod -aG docker $(whoami)
