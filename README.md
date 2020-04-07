## Docker image for AWS IoT Secure Tunnel ssh client
[AWS IoT Secure Tunneling](https://docs.aws.amazon.com/iot/latest/developerguide/secure-tunneling.html) requires a localproxy which needs to be built from sources. This Docker images uses a pre-built image from [https://github.com/t04glovern/aws-greener-grass](https://github.com/t04glovern/aws-greener-grass) so we can ssh from Windows/Mac desktops without having to build from sources.


### Usage
Open a Tunnel using [this](https://docs.aws.amazon.com/iot/latest/developerguide/secure-tunnel-tutorial.html) tutorial to obtain a source access token first.

Login using a username/password...
```sh
docker run -it --rm \
	-e AWS_REGION=us-east-1 \
	-e SOURCE_ACCESS_TOKEN=<source access token for the tunnel> \
	-e REMOTE_USER=<remote user> \
	buchupally/aws_iot_tunnel_ssh
```
Login using a ssh key...
```sh
docker run -it --rm \
	-e AWS_REGION=us-east-1 \
	-e SOURCE_ACCESS_TOKEN=<source access token for the tunnel> \
	-e REMOTE_USER=<remote user> \
	-e SSH_PRIVATE_KEY_FILE=/host/id_rsa \
	-v $PWD:/host \
	buchupally/aws_iot_tunnel_ssh
```
NOTE: This container only helps with ssh once the tunnel is open on the destination IoT device which needs an agent that listens for the open tunnel message from AWS IoT and runs the localproxy in destination mode. See [https://docs.aws.amazon.com/iot/latest/developerguide/agent-snippet.html](https://docs.aws.amazon.com/iot/latest/developerguide/agent-snippet.html) or [https://devopstar.com/2019/11/24/greener-grass-device-setup](https://devopstar.com/2019/11/24/greener-grass-device-setup).
