# A-Study-of-Remote-Procedure-Call

## Introduction
Remote Procedure call is a software communication protocol that one program can use to request a service from another located in another computer on a network without having to understand the network's details. 

## Abstract
In this report, we will introduce the concepts of Remote Procedure Call (RPC), Docker networking, how to build the entire system, and how to use the service. In addition, we made the project image public, so that everyone can test whether the service is worked well. During the implementation process, we used alpine docker image as the project environment, used “libtirpc” Linux package to implement the RPC service, and built two containers with network bridge based on this image as client and server. Finally, we expect the service can work normally and prepare for the further implementation and improvement.

## How to use the docker package
```bash=
docker pull ghcr.io/su-terry/adder-rpc-x64:latest
docker network create --driver bridge rpc-bridge-net

# Create Client/Server containers
docker run -dit --name rpc-server --network=rpc-bridge-net ghcr.io/su-terry/adder-rpc-x64:latest ash
docker run -dit --name rpc-client --network=rpc-bridge-net ghcr.io/su-terry/adder-rpc-x64:latest ash

# Enter rpc-server container
docker exec -it rpc-server ash
# In rpc-server container
rpcbind
make -f Makefile.add
./add_server &
exit

# Enter rpc-client container
docker exec -it rpc-client ash
# In rpc-client container
make -f Makefile.add
./add_client test1
exit

# Remove all
docker rm -f rpc-server
docker rm -f rpc-client
docker network rm rpc-bridge-net
docker rmi -f ghcr.io/su-terry/adder-rpc-x64:latest
```

## Test file format explanation
The first line contains a single integer n, indicating n requests.
Next following n lines. Each line has two integers or strings indicating the object to be added.

## Output explanation
If the request contains two integers, the rpc-client will request Add method from rpc-server and show the result.
Otherwise, it will show the error message about wrong input format.
