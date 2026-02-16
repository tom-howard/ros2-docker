FROM --platform=linux/arm64 ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DISTRO=jazzy
ENV QT_X11_NO_MITSHM=1
ENV EDITOR=nano

# Base deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl gnupg lsb-release \
    git build-essential cmake \
    sudo nano vim tmux wget less tree eog \
    xorg-dev \
    mesa-utils libgl1 libglx-mesa0 libegl1 libgles2 \
    net-tools iputils-ping iproute2 \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip python3-venv python3-scipy \
    python3-pandas python3-pydantic \
 && rm -rf /var/lib/apt/lists/*

# Add ROS 2 apt repo key + source list (Jazzy on Ubuntu 24.04)
RUN mkdir -p /etc/apt/keyrings \
 && curl -fsSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
    | gpg --dearmor -o /etc/apt/keyrings/ros-archive-keyring.gpg \
 && echo "deb [arch=arm64 signed-by=/etc/apt/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" \
    > /etc/apt/sources.list.d/ros2.list

# Install ROS Jazzy desktop + tools + Gazebo bridge + Turtlebot3 sim
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-jazzy-desktop \
    python3-rosdep python3-colcon-common-extensions \
    ros-jazzy-rmw-cyclonedds-cpp \
    ros-jazzy-ros-gz \
    ros-jazzy-ros-gz-sim \
    ros-jazzy-ros-gz-bridge \
    ros-jazzy-ros-gz-image \
    ros-jazzy-turtlebot3 \
    ros-jazzy-turtlebot3-msgs \
    ros-jazzy-turtlebot3-simulations \
    ros-jazzy-turtlebot3-gazebo \
 && rm -rf /var/lib/apt/lists/*

# rosdep init (safe to run even if already initialized)
RUN rosdep init || true

# Create student user
RUN useradd -ms /bin/bash student \
 && usermod -aG sudo student \
 && echo "student ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/student \
 && chmod 0440 /etc/sudoers.d/student

RUN curl -fsSL https://starship.rs/install.sh | sh -s -- --yes || true

USER student
ARG HOME_DIR=/home/student
WORKDIR /home/student

RUN touch ~/.hushlogin \
 && mkdir -p ~/.diamond \
 && mkdir -p ~/ros2_ws/src \
 && mkdir -p ~/.ssh

# Enable starship prompt for the student user
RUN if [ -f "/usr/local/bin/starship" ]; then \
      echo 'eval "$(starship init bash)"' >> ~/.bashrc; \
    fi

# Environment defaults
COPY ./source/ros2-docker-configs.sh ${HOME_DIR}/.diamond/ros2-docker-configs.sh
COPY ./source/bash-aliases ${HOME_DIR}/.diamond/bash-aliases
RUN echo "source ~/.diamond/ros2-docker-configs.sh" >> ${HOME_DIR}/.bashrc

# Is this necessary? The student user should already own these files, but just in case...
RUN sudo chown -R student:student ${HOME_DIR}/.diamond && \
   sudo chown -R student:student ${HOME}/ros2_ws

CMD ["bash", "-l"]
