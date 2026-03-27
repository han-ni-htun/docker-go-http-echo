FROM alpine:3.23.3

# CA bundle (you may not need this if alpine's ca-certificates works for you)
ADD "https://curl.haxx.se/ca/cacert.pem" "/etc/ssl/certs/ca-certificates.crt"

# Copy your prebuilt http-echo binary into the image
COPY ./pkg/linux_amd64/http-echo /http-echo

RUN apk add --no-cache \
    curl \
    bind-tools \
    net-tools \
    iptables \
    iproute2

ENTRYPOINT ["/http-echo"]
