alias dm="docker-machine"
#Start named docker machine. It must be created first
dm-activate(){
  machineName=$1
  docker-machine start $machineName
  if [[ $? -eq 0 ]]; then
    eval $(docker-machine env $machineName)
    activeMachine=$(docker-machine active 2> /dev/null)
    echo -e "Docker Machine $machineName has been started and environment set"
    if [ -n ${activeMachine} ]; then
      PROMPT=" (🐳  ${activeMachine} ) $PROMPT"
    fi
  else
    echo -e "Unable to start machine $machineName. Has it been created or is there already a Docker Machine running?"
  fi
}
#Stop the current running machine, reset prompt and unset all related env variables
dm-deactivate(){
  activeMachine=$(docker-machine active 2> /dev/null)
  if [[ ! -z $activeMachine ]]; then
    docker-machine stop $activeMachine
    export DOCKER_TLS_VERIFY=""
    export DOCKER_HOST=""
    export DOCKER_CERT_PATH=""
    export DOCKER_MACHINE_NAME=""
    source ~/.zshrc
  else
    echo -e "Unable to determine active machine. Is a machine really running?"
  fi
}
