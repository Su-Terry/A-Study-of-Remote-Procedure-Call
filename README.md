# A-Study-of-Remote-Procedure-Call

## Introduction
Remote Procedure call is a software communication protocol that one program can use to request a service from another located in another computer on a network without having to understand the network's details. 

## Abstract
In this report, we will introduce the concepts of Remote Procedure Call (RPC), Docker networking, how to build the entire system, and how to use the service. In addition, we made the project image public, so that everyone can test whether the service is worked well. During the implementation process, we used alpine docker image as the project environment, used “libtirpc” Linux package to implement the RPC service, and built two containers with network bridge based on this image as client and server. Finally, we expect the service can work normally and prepare for the further implementation and improvement.
