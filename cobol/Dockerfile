FROM ubuntu:24.04

RUN apt-get update

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN apt-get install -y tzdata

RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y gnucobol

CMD /bin/bash
