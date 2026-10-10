# Use a Debian-based image with the glibc runtime required by the application.
FROM debian:bookworm-slim

# Install CA certificates and networking utilities for troubleshooting.
# Remove cached package lists to minimize the final image size.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        dnsutils \
        net-tools \
        iptables \
        iproute2 && \
    rm -rf /var/lib/apt/lists/*

# Copy the precompiled Linux AMD64 HTTP Echo executable into the image.
COPY ./pkg/linux_amd64/http-echo /http-echo

# Configure the HTTP Echo executable as the container's main process.
ENTRYPOINT ["/http-echo"]
