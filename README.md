[![Build Status](https://travis-ci.org/lordsoffallen/docker-images.svg?branch=master)](https://travis-ci.org/lordsoffallen/docker-images)

## `Dockerfile` links

* [`python3.7`, `latest` _(Dockerfile)_](https://github.com/lordsoffallen/docker-images/blob/master/py37/Dockerfile)
* [`python3.7-cuda10.2` _(Dockerfile)_](https://github.com/lordsoffallen/docker-images/blob/master/p37-cuda10.2/Dockerfile)

# python-machine-learning

[**Docker**](https://www.docker.com/) image with **[Python](https://www.python.org/) 3.7** for Machine Learning.

Uses [**Conda**](https://conda.io/en/latest/) (installed with [Miniconda](https://docs.conda.io/en/latest/miniconda.html)).

Includes optional variants with [**Nvidia CUDA**](https://www.geforce.com/hardware/technology/cuda).

**GitHub repo**: [https://github.com/lordsoffallen/docker-images](https://github.com/lordsoffallen/docker-images)

**Docker Hub image**: [https://hub.docker.com/r/ftopal/machine-learning](https://hub.docker.com/r/ftopal/machine-learning)

## Description

This Docker image is made to serve as a base for other images and projects for Machine Learning, Data Science, Deep Learning, etc.

It does not try to include every possible package. On the contrary, it tries to be as slim as possible, but having the minimal common requirements (the difficult parts) for most projects.

By being slim, apart from reducing the size, it can be kept current more easily, and it can be tailored for each project, being equally useful for development and production.

### Nvidia CUDA

[**Nvidia CUDA**](https://www.geforce.com/hardware/technology/cuda) is needed to be able to use the GPU, mainly for Deep Learning. There are optional image versions (tags) including CUDA.

For these versions to work, you need to have an Nvidia GPU and have [**nvidia-docker**](https://github.com/NVIDIA/nvidia-docker) installed.

**nvidia-docker** is in many cases easier to install and use than installing the full set of dependencies (CUDA, CuDNN, etc) in your local machine.

This is especially true when you have more than one project, with different dependencies/versions.

## How to use

* You don't need to clone the GitHub repo. You can use this image as a base image for other images, using this in your `Dockerfile`:

```Dockerfile
FROM ftopal/machine-learning:py37

COPY ./main.py /app/main.py
```

or any of the image variants, e.g.:

```Dockerfile
FROM ftopal/machine-learning:py37-cuda10.2

COPY ./main.py /app/main.py
```

By default it just checks and prints the versions of the software installed, Conda and Python. Also Nvida GPU and TensorFlow, in their respective image versions (tags).

You can override that behavior and run your own program creating a file at `/start.sh`.

For example:

```Dockerfile
FROM ftopal/machine-learning:py37

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

COPY ./main.py /app/main.py
```

**Note**: As the default command (`CMD`) is to run `/start.sh`, if you provide/overwrite that file, you don't have to add a `CMD /start.sh` in your `Dockerfile`.

## CUDA Technical details

First, to be able to run the CUDA versions with Docker you need to be on Linux, have Docker and an Nvidia GPU.

Then, there are compatibility requirements between versions.

### CUDA, GPU Driver, Nvidia Model

**CUDA** has to be a version that is compatible with the **Nvidia GPU driver**, which is compatible with a **GPU architecture** (a series of specific GPU models). The CUDA versions require Nvidia GPU driver versions "superior to" some driver number (they are backward compatible).

You can see the [compatibility table](https://github.com/NVIDIA/nvidia-docker/wiki/CUDA#requirements) at the **nvidia-docker** site.


## Release Notes

### 0.1.0

* First release, including Python 3.7 and CUDA.

## License

This project is licensed under the terms of the MIT license.
