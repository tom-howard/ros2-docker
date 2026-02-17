#! /usr/bin/env zsh

COMMANDS=' start | stop | shell | system '
P=$0
COMMAND=$1
B="$(basename ${P})"
SCRIPT_NAME="$(cd "$(dirname "${P}")" && pwd)/$(basename "${P}")"
PKG_PATH="$(dirname ${SCRIPT_NAME})"
SYSTEM_FILE="${PKG_PATH}/.system_type"
USAGE="$B ${COMMANDS}"

export ROS_PROJECT_PATH="${HOME}/my_ros2_docker_workspace"

check_system_type() {
    if [[ -f ${SYSTEM_FILE} ]]; then
        SYSTEM_TYPE=$(cat ${SYSTEM_FILE})
    else
        echo "System type has not been set. Please set it using the 'system' command."
        exit 0
    fi
}

start() {
    xhost +local:docker
    mkdir -p ${ROS_PROJECT_PATH}
    docker compose -f docker-compose.${SYSTEM_TYPE}.yml up -d --build
}

stop() {
    docker compose -f docker-compose.${SYSTEM_TYPE}.yml down
}

shell() {
    echo "Launching the ROS 2 environment, type 'exit' to leave once you're done."
    docker exec -it ros2-docker /bin/bash
}

system() {
    case $1 in
      linux)
        echo "linux" > ${SYSTEM_FILE}
        ;;
      mac)
        echo "mac" > ${SYSTEM_FILE}
        ;;
      *)
        echo "Please specify either 'linux' or 'mac'"
        exit 0
    esac
}

case $COMMAND in 
  start|stop|shell)
    check_system_type
    ${COMMAND}
    ;;
  system)
    ${COMMAND} $2
    ;;
  *) 
    echo "Invalid Input..."
    echo "$USAGE"
    exit 0
    ;;
esac
