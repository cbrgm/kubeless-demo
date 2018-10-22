FROM ubuntu:latest

ENV KUBECONFIG /root/kubeconfig

RUN apt-get update -y && apt-get upgrade -y && apt-get install curl apt-transport-https gnupg unzip -y && \
	curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
	echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
	apt-get update -y && apt-get install -y kubectl

RUN export RELEASE=$(curl -s https://api.github.com/repos/kubeless/kubeless/releases/latest | grep tag_name | cut -d '"' -f 4) && \
	export OS=$(uname -s| tr '[:upper:]' '[:lower:]') && \
	curl -OL https://github.com/kubeless/kubeless/releases/download/$RELEASE/kubeless_$OS-amd64.zip && \
	unzip kubeless_$OS-amd64.zip && \
	mv bundles/kubeless_$OS-amd64/kubeless /usr/local/bin/

WORKDIR /demo
COPY ./kubeconfig $KUBECONFIG
COPY ./sample /demo

