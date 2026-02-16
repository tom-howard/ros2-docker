# Running the ROS 2 Docker Container(s) on MAC

The ROS 2 environment is accessed via the `ros2-docker.zsh` script. 

Find out what shell you are using by running the command `echo $SHELL`. 

If the output of this is `/bin/bash` then use `ros2-docker.sh` in the instructions that follow. If the output is `/bin/zsh` then use `ros2-docker.zsh`. (If you're on a Mac, you'll more than likely need to use `ros2-docker.zsh`.)

To begin, navigate into the `ros2-docker` repository:

```bash
cd ~/ros2-docker
```

Then, **make sure you are on the right branch for MAC OS** and it's always worth quickly checking for any updates:

```bash
git branch --show-current
git pull
```

## Starting the Container

> [!IMPORTANT]
> **Mac users** will need to ensure that the Docker Desktop app is running first.

To build the ROS 2 Docker environment, run the following (it may take some time to build the first time around, or after a significant update).

```zsh
./ros2-docker.zsh start
```

## Entering the ROS 2 "Shell"

The following command will launch the *"shell"*, where you can access all the `ros2` tools you'll need.

```zsh
./ros2-docker.zsh shell
```

[For information on how to open and edit files in the ROS 2 Container from VS Code, see here](./vscode.md).

> [!IMPORTANT]
> **MacOS users:** Any GUI window opened will have to be viewed using the noVNC viewer at <http://localhost:8080/vnc.html>
>
> For a better VNC experience, in the settings toolbox, set the scaling mode to local.

## Proceed to The ROS 2 Course

Having launched your ROS 2 Environment successfully, you're now ready to take on **[The ROS 2 Course](https://tom-howard.github.io/ros2/course/)**...

## Stopping the Container

Once you are done working, exit the ROS 2 environment with `exit`.

To stop the container, run the following:

```zsh
./ros2-docker.zsh stop
```
