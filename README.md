# Testing Zed SDK in a Docker container imaging Jetpack OS. 

## Motivation:

Optimizing our Yolov5 network with TensorRT on the Jetson has had many difficulties. The issue we're facing with the TensorRT optimization is that while the script runs, the Jetson GPU runs out of memory. We were trying to fix this by generating an engine file on the laptop in Ubuntu but the issue we were facing there was that Zed-SDK drivers were compatible with Jetpack OS, and there are further compatibility concerns. If we run a docker container that images Jetpack, with TensorRT and perhaps even the zed-sdk already installed, then we can allow the container access to the laptops GPU memory, and run the entire script process in that container, eliminating any compatibility concerns.


## Important Notes:

In order to run this docker container on an Ubuntu laptop, you will need to install QEMU and Docker to set up our emulated environment. QEMU is an open-source machine emulator and virtualizer. It allows users to build ARM CUDA binaries on their x86 machine without needing a cross-compiler. (https://www.stereolabs.com/docs/docker/building-arm-container-on-x86)

If the above link doesn't work, try: https://www.tecmint.com/install-qemu-kvm-ubuntu-create-virtual-machines/. However, don't install anything past `$ sudo apt install qemu-kvm virt-manager virtinst libvirt-clients bridge-utils libvirt-daemon-system -y`. The rest is irrelevant visualization tools. The important thing is to get qemu installed.

You can check QEMU is installed by running:

`$ apt show qemu-system-x86`

The Dockerfile is included in this repository. You can use it to create a container by running 

`$ docker build -t your_container_name_here . `

Once the image has been built, you can run an interactive version of the container with:

`$ docker run -it --rm --platform linux/arm64 your_container_name_hereker run -it --rm --platform linux/arm64 your_container_name_here`

Once this command has been run you will be in a Jetson environment with the Zed SDK and necessary C++ code installed. 
 
`cd tensor_rt/build; cmake ..` 