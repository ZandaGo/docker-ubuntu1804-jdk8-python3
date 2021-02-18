FROM ubuntu:18.04

MAINTAINER panda

ENV TZ=Asia/Shanghai

ADD sources.list /etc/apt/sources.list

RUN apt-get update \
    && apt-get upgrade -y \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt-get install tzdata -y \
    && apt-get install openjdk-8-jdk python3 python3-pip vim git -y \
    && mkdir -p /root/.pip

COPY pip.conf /root/.pip/pip.conf

RUN pip3 install --upgrade pip
