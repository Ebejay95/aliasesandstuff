# syntax=docker/dockerfile:1
FROM ubuntu:22.04
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get install zsh wget valgrind curl python3 python3-pip \
	build-essential libreadline-dev psmisc php git -y
RUN sh -c "$(wget -O /root/.zshrc https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc)"
RUN pip3 install setuptools
RUN pip3 install norminette
WORKDIR /host/