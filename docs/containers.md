# Running the ROS 2 Docker Container(s)

The ROS 2 environment is accessed via the `ros2-docker.sh` or `ros2-docker.zsh` scripts. 

Find out what shell you are using by running the command `echo $SHELL`. 

If the output of this is `/bin/bash` then use `ros2-docker.sh` in the instructions that follow. If the output is `/bin/zsh` then use `ros2-docker.zsh`. (If you're on a Mac, you'll more than likely need to use `ros2-docker.zsh`.

To begin, navigate into the `ros2-docker` repository:

```bash
cd ~/ros2-docker
```

## Initial Step: Set your system

Specify your system:

```bash
./ros2-docker.sh system X
```

Or

```zsh
./ros2-docker.zsh system X
```

Where `X` should be either `linux` or `mac` as appropriate.

## Starting the Container

Mac users will need to ensure that the Docker Desktop app is running first.

```bash
./ros2-docker.sh start
```

Or

```zsh
./ros2-docker.zsh start
```

## Entering the ROS 2 "Shell"

<!-- > [!IMPORTANT]
> **Linux users:** If you are on wayland, make sure you have xwayland support and the `xorg.xhost` package installed. -->

The following command will launch the shell where you can start using all the `ros2` tools you need.

```bash
./ros2-docker.sh shell
```

Or

```zsh
./ros2-docker.zsh shell
```

[For information on how to open and edit files in the ROS 2 Container from VS Code, see here](./vscode.md).

> [!IMPORTANT]
> **MacOS users:** Any GUI window opened will have to be viewed using the noVNC viewer at
> <http://localhost:8080/vnc.html>
>
> For a better VNC experience, in the settings toolbox, set the scaling
> mode to local.

## Stopping the Container

Once you are done working, exit the ROS 2 environment wth `exit`.

To stop the container, run the following:

``bash
./ros2-docker.sh stop
```

Or

```zsh
./ros2-docker.zsh stop
```
