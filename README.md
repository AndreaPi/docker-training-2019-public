# Docker training 2019

This repo contains a simple exercise on how to write Dockerfiles. The goals of the exercise are: 

 - to show the advantages of the [Depend on Docker](https://github.com/bhgedigital/depend-on-docker) framework
 - to illustrate some common pitfalls when using Docker (e.g., naming images, setting proxies, hanging containers) 
 - to perform inference with a ResNet-50 model, using Keras in a Jupyter notebook 
 - to perform inference with a RetinaNet model, using Keras in a Jupyter notebook
 - (optional) to show how easy is to rerun the inference on a GPU-enabled environment, thanks to Docker

### Examples

The example is:
- [Keras ResNet-50 example]()

Details on how to run the notebook above are given below.

### Implementation: depend-on-docker

Depend on Docker, a.k.a as {DoD},  is an easy to use project template that simplifies the use of Docker, on any OS, locally, in a data center, or on the cloud. With Docker, the only dependency you need to run your code everywhere is Docker itself!

To perform inference with the ResNet-50 model in Keras, every time we move to a different machine we would have to:

 - configure proxies
 - install conda and create a conda env, or install Python and create a virtual environment
 - (possibly) configure paths
 - install Tensorflow, Keras, Pillow, opencv-python, h5py, numpy, jupyter in the venv/conda env

Even more packages would have to be installed if we also wanted to _train_ a ResNet-50 model. Instead, we packaged all the necessary dependencies into our image. **Running the Jupyter notebook** become very simple: `./run.sh` will get you your own Jupyter Notebook server! After that, simply open Chrome and browse to http://localhost:5555. 

#### Minimal [{DoD}](https://github.com/bhgedigital/depend-on-docker)

For ease of use, all Docker commands required to use this project were embedded into intuitively named shell scripts, a subset of the whole {DoD} framework .

##### Build

    ./build.sh 

Builds the Docker container image and tags it using the registry and version tag settings specified in your environment file

##### Run

    ./run.sh [command] 

Creates a Docker container and, if no argument is specified, executes the startup script. If a command line is specified as an argument to the run script, this command line is executed in the container in place of the default startup script.

##### Status

    ./status.sh 

This script shows the current status of the Docker container including any mapped ports.

##### Stop

    ./stop.sh 

Stops the container and cleans up its files.

### Presentation
Slides giving some background on Docker and introducing the exercise are [here]()


