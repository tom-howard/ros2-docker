# Setup Containers with VS Code

Follow the steps below to access and edit files (and ROS 2 Packages) within the ROS 2 Docker container.

## Step 1

Install the Dev Containers extension from the 'extensions' menu in VS Code.
![](images/extension.png)

## Step 2

Attach VS Code to the running container. 

Using the Command menu (MacOS: `Cmd+ Shift + P`, Linux: `Ctrl + Shift + P`), type in `attach to running container`

![](images/command-menu.png)

Here select `/ros2-docker`.

Now allow VS Code some time as it installs itself in the container.

When you see the new window appear, click open folder and choose `/home/student`

Now you can just work in VS Code.

> [!NOTE]
> You can check the bottom left corner of the VS Code window to see if you have it working properly!

## Bonus Tip:

Use the VS Code terminals to avoid having to run the `shell` command every time you need to open a new terminal.