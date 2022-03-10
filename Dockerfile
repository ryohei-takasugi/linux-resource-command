FROM ruby:slim-bullseye
# common lib install
RUN apt-get update && apt-get -y upgrade &&\
    apt-get -y install gnupg wget curl vim unzip zip git
# make bind mounts dir
RUN mkdir -p /root/projects