ARG ROS_VERSION=jazzy
FROM osrf/ros:${ROS_VERSION}-desktop

ARG ROS_VERSION
ENV DEBIAN_FRONTEND=noninteractive

ENV DEFAULT_USER=robot

RUN echo "[INFO] Update Ubuntu" && \
    apt-get update && apt-get install -o Dpkg::Options::="--force-confnew" -fuy \
    nano sudo keychain rsync software-properties-common \
    mesa-utils libglu1-mesa-dev libegl1-mesa-dev libgl1-mesa-dev libgles2-mesa-dev && \
    apt-get dist-upgrade -o Dpkg::Options::="--force-confnew" -fuy && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "[INFO] Set locale" && \
    apt-get update && \
    apt-get install locales && \
    locale-gen en_GB en_GB.UTF-8 && \
    update-locale LC_ALL=en_GB.UTF-8 LANG=en_GB.UTF-8

RUN echo "[INFO] Install Other Useful Packages" && \
    apt-get update && apt-get install -y \
    cmake \
    curl \
    less \
    vim \
    tmux \
    tree \
    wget \
    python3-pip \
    python3-venv \
    python3-scipy \
    python3-pandas \
    python3-pydantic && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "[INFO] Install Additional ROS tools" &&\
    apt-get update && apt-get install -y \
    ros-dev-tools \
    python3-rosdep \
    python3-colcon-common-extensions \
    ros-${ROS_VERSION}-turtlebot3-msgs \
    ros-${ROS_VERSION}-rmw-cyclonedds-cpp \
    ros-${ROS_VERSION}-rmw-zenoh-cpp \
    ros-${ROS_VERSION}-librealsense2 \
    ros-${ROS_VERSION}-realsense2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "[INFO] Add the Default User Profile" && \
    adduser --disabled-password --gecos '' ${DEFAULT_USER} && \
    usermod -aG sudo ${DEFAULT_USER} && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' | tee -a /etc/sudoers

USER ${DEFAULT_USER}
ARG HOME_DIR=/home/${DEFAULT_USER}
WORKDIR ${HOME_DIR}

RUN mkdir -p ${HOME_DIR}/ros2_ws/src/ && \
    mkdir -p ${HOME_DIR}/repos

WORKDIR ${HOME_DIR}/repos
RUN git clone -b ${ROS_VERSION} https://github.com/ROBOTIS-GIT/turtlebot3.git && \
    git clone -b ${ROS_VERSION} https://github.com/tom-howard/tuos_ros.git 

WORKDIR ${HOME_DIR}/repos/turtlebot3
RUN cp -r turtlebot3_description turtlebot3_bringup turtlebot3_teleop turtlebot3_node \
    ${HOME_DIR}/ros2_ws/src/

WORKDIR ${HOME_DIR}/repos/tuos_ros
RUN cp -r tuos_tb3_tools ${HOME_DIR}/ros2_ws/src/

WORKDIR ${HOME_DIR}/ros2_ws
RUN source /opt/ros/${ROS_VERSION}/setup.bash && colcon build

COPY ./source/ros2-waffle-configs.sh ${HOME_DIR}/ros2-waffle-configs.sh
COPY ./source/bash-aliases ${HOME_DIR}/bash-aliases
RUN echo "source ~/ros2-waffle-configs.sh" >> ${HOME_DIR}/.bashrc

CMD ["bash", "-l"]
