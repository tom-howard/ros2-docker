# MacOS

## 1. Install Docker Desktop

You must install Docker Desktop for Mac and ensure it is running before proceeding. [Follow the instructions here to install Docker Desktop](https://docs.docker.com/desktop/setup/install/mac-install/) 

> [!IMPORTANT]
> Docker Desktop doesn't support GPU acceleration on macOS: Gazebo performance may be less than optimal.

## 2. Clone this repository to your system

Clone this repository to your home directory using the command below:

```zsh
git clone https://github.com/tom-howard/ros2-docker.git ~/ros2-docker --depth 1
```
<!-- 
### Set up the launcher script

> [!NOTE]
> The assumption is that you are using zsh as your shell (the default on a Mac).

To run the container, you'll need to make sure the launcher script has execute permissions:

```zsh
cd ros2-docker/
```

```zsh
chmod +x ros2-docker-mac.zsh
``` -->

## 3. Specify your system

Run the following one-time command to point the launcher scripts ([described here](./containers.md)) to the correct Docker files for your system (Mac).

```zsh
./ros2-docker.zsh system mac
```

## 4. Launch the ROS 2 Environment

Refer to [the steps here](./containers.md).
