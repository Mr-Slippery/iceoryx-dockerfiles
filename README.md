This repository contains files related to building and running [Eclipse iceoryx](https://github.com/eclipse/iceoryx) using Docker.

Simply launch: `./test_build.sh` to build Eclipse iceoryx inside a Docker image and then launch a container running the RouDi daemon and two test programs, `ice_sender` and `ice_receiver` that communicate through iceoryx.

Expected output looks like:

```
Sending build context to Docker daemon  82.43kB
Step 1/5 : FROM ubuntu:bionic
 ---> 4c108a37151f
Step 2/5 : ARG revision
 ---> Running in 3d5f8ad99d36
Removing intermediate container 3d5f8ad99d36
 ---> 716792bca1fb
Step 3/5 : USER root
 ---> Running in 6222e5afff3c
Removing intermediate container 6222e5afff3c
 ---> 76f9dbe136f2
Step 4/5 : RUN apt update && apt install -y         cmake         libacl1-dev         libncurses5-dev         pkg-config 	git
 ---> Running in f30a73ed771b

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Get:1 http://archive.ubuntu.com/ubuntu bionic InRelease [242 kB]
Get:2 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
...
[100%] Linking CXX executable icedelivery/ice_receiver_simple
[100%] Built target ice_receiver_simple
>>>>>> finished building iceoryx examples <<<<<<
Removing intermediate container ef8fae95c0e9
 ---> ee2c34894ad1
Successfully built ee2c34894ad1
Successfully tagged iceoryx:master
12de8fba8fdf49a4e75fda3ca2e65187b213356ef9b6b1c49afcdefac392cfb1
Not subscribed
Receiving: 3
Receiving: 4
Receiving: 5
Receiving: 6
Receiving: 7
Receiving: 8
Receiving: 9
Receiving: 10
Receiving: 11
Receiving: 12
Receiving: 13
Receiving: 14
Receiving: 15
Receiving: 16
Receiving: 17
Receiving: 18
Receiving: 19
Receiving: 20
Receiving: 21
roudi
roudi
```
