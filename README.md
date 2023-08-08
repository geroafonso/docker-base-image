# Base Tools

This repository creates a Docker image based on the `golang:1.13-buster` image, which is Go 1.13 on Debian Buster. It includes tools like SOPS, Helm, Helmfile, Helm plugins, and kubectl.

## Environment Setup
The Dockerfile sets up the following environment:

- SOPS Version: 3.7.3
- Helm Version: v3.12.2
- Helmfile Version: v0.144.0
- Debian frontend set to noninteractive mode.

The Docker image is preconfigured with the specific versions of SOPS, Helm, and Helmfile. Kubectl is also included, but the Dockerfile currently does not specify the version.

## Build Instructions

To build the Docker image, navigate to the directory containing the Dockerfile and run the following command:

```bash
docker build -t your-image-name .
```

Replace `your-image-name` with the desired name for your Docker image.

## Running a Container

After the Docker image has been successfully built, you can start a container with:

```bash
docker run -it --rm your-image-name
```

Note: This README assumes you are familiar with Docker, Dockerfile syntax, and the command-line tools mentioned in the Dockerfile. If not, it is recommended to visit their respective documentation for better understanding.

## Additional Notes

This Dockerfile does not complete the installations for the tools mentioned. Additional commands are required to install SOPS, Helm, Helmfile, and kubectl. The version numbers provided in the Dockerfile serve as environmental variables that can be used during the installation commands. 

Remember to always review and understand the content of a Dockerfile before using it, for your own security and for compatibility with your specific needs. 
