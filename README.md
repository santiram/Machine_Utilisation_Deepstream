# Machine_Vision App
Machine vision systems are a set of integrated components that are designed to use information extracted from digital images to automatically guide about the machine utilisation along with their efficiency of machine , work start time and work end time.

![alt text](https://github.com/[santiram]/[Machine_Vision_Deepstream ]/blob/[main]/images/machine_utilisation_image.png?raw=true)

Machine Vision can monitor on itself when the specific task has been started so that we can keep a track of our machine efficiency and other aspects.

# Citations
 AlexeyAB/darknet


# Index 

    1. Introduction
    2. Deepstream Setup
        a. Install System Dependencies
        b. Install Deepstream

    3. Running the Application
        a. Clone the repository
        b. Run with different input sources

# Introduction

 Machine_Vision is An Intelligent Video Analytics Pipeline powered by Deepstream and NVIDIA Jetson Xavier NX.

 ![alt text](https://github.com/[santiram]/[Machine_Vision_Deepstream ]/blob/[main]/nano.jpg?raw=true)

 This project is Proof of concept of AI vison moitoring can be installed to provide the insigtful information using the Vedio analytics . 


## Deepstream Setup

    This post assumes you have a fully functional Jetson device. If not, you can refer the documentation here.
# 1. Install System Dependencies

    sudo apt install \
    libssl1.0.0 \
    libgstreamer1.0-0 \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    libgstrtspserver-1.0-0 \
    libjansson4=2.11-1

# 2. Install Deepstream

    Download the DeepStream 5.0.1 Jetson Debian package deepstream-5.0_5.0.1-1_arm64.deb, to the Jetson device from here. Then enter the command:

    sudo apt-get install ./deepstream-5.0_5.0.1-1_arm64.deb

## Running the Application

# 1. Clone the repository

    This is a straightforward step, however, if you are new to git or git-lfs, I recommend glancing threw the steps.

    First, install git and git-lfs

    sudo apt install git git-lfs

    Next, clone the repository

# Using HTTPS
    git clone https://github.com/santiram/Machine_Vision_Deepstream.git

# Using SSH
    git clone git@github.com:santiram/Machine_Vision_Deepstream.git

    Finally, enable lfs and pull the yolo weights

    git lfs install
    git lfs pull

# 2. Run with different input sources

    The computer vision part of the solution can be run on one or many input sources of multiple types, all powered using NVIDIA Deepstream.

    First, build the application by running the following command:

    make clean && make -j$(nproc)

    This will generate the binary called Machine_utilisation. This is a one-time step and you need to do this only when you make source-code changes.

    Next, create a file called inputsources.txt and paste the path of videos or rtsp url.

    file:///home/sr/Downloads/Plasma cutting steel.mp4
    file:////home/sr/Downloads/laser_cutting_machine_2.mp4

    Now, run the application by running the following command:

    ./Machine_utilisation 
