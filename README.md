# Install Go
```
sudo su

curl -sL https://go.dev/dl/go1.26.1.linux-amd64.tar.gz -o go1.26.1.linux-amd64.tar.gzs
```
# Working directory `/home/sai/pov-consul-2026/go-learn`
```
git clone https://github.com/hashicorp/http-echo.git
cd http-echo

```

# Build
```
GOOS=linux GOARCH=amd64 go build -o /home/sai/pov-consul-2026/go-learn/pkg/linux_amd64/http-echo

chmod +x pkg/linux_amd64/http-echo
```

# Create Dockerfile

# Login to your DockerHub
```
$ docker login
Authenticating with existing credentials... [Username: hellocloud]

i Info → To login with a different account, run 'docker logout' followed by 'docker login'


Login Succeeded
```

# Build the image
```
IMAGE_NAME=hellocloud/http-echo-server
IMAGE_TAG=3.23.3

docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${IMAGE_NAME}:${IMAGE_TAG}
docker push ${IMAGE_NAME}:${IMAGE_TAG}
```

# Verify in DockerHub
```
https://hub.docker.com/repository/docker/hellocloud/http-echo-server/general
```