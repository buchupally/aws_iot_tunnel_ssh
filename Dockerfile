FROM ubuntu:latest

RUN apt-get update && apt-get install -y wget openssh-client

RUN wget https://github.com/t04glovern/aws-greener-grass/raw/master/.blog/greengrass-secure-tunnel/binaries/localproxy-x86_64 -O localproxy \
	&& chmod +x localproxy \
	&& mv localproxy /usr/bin/localproxy

COPY helper.sh helper.sh

CMD ./helper.sh
