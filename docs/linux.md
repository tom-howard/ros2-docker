# Linux

## 1. Installing Docker (and Docker Compose)

### Ubuntu/Debian
Make sure to install docker using [this guide](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04).

> [!NOTE]
> Does not work with Docker Desktop. If you have installed it through `snap` or any other method apart from using `apt` then uninstall it, and install it using the guide above.

**Important**: Make sure you complete Step 2 of the guide *"Executing the Docker Command Without Sudo"* as you need to be able to use the `docker` command without root permissions.

### Arch Linux (Artix/Endeavour/Manjaro)

You can install it using the command below, but also refer to the [documentation](https://wiki.archlinux.org/title/Docker) to run the service, and execute `docker` without root permissions.

```shell
sudo pacman -S docker docker-compose
```

### Fedora

You can use the command below to install it on Fedora 41 and newer. Make sure to refer to the [documentation](https://docs.fedoraproject.org/en-US/quick-docs/installing-docker/) as this is untested.

```bash
sudo dnf install docker-cli containerd docker-compose
```

## 2. Clone this repository to your system

Clone this repository to your home directory using the command below:

``` bash
git clone https://github.com/tom-howard/ros2-docker.git ~/ros2-docker --depth 1
```

<!-- ### Set up the launcher script

> [!NOTE]
> The assumption is that you are using bash as your shell.

To run the container, you'll need to make sure the launcher script has execute permissions:

```bash
cd ros2-docker/
```

```bash
chmod +x ros2-docker.sh
``` -->

<!-- > [!WARNING]
> If you are running Linux, you need to allow have Xwayland running with the following xhost command added to your shell configuration `xhost +local:root -->

## 3. Specify your system

Navigate into the `ros2-docker` repository:

```bash
cd ~/ros2-docker
```

Then, run the following one-time command to point the launcher scripts ([described here](./containers.md)) to the correct Docker files for your system (Linux). The assumption here is that you are using `bash` for your shell. For `zsh`, change the extension accordingly.

```bash
./ros2-docker.sh system linux
```

## 4. Launch the ROS 2 Environment

Refer to [the steps here](./containers.md).