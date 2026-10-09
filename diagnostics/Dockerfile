FROM alpine:3.23@sha256:85fe1e81d6758c208f3e1eed4338a1997e19d4be002d4dd32d3100c9a8c010a0
RUN apk add --no-cache bash docker-cli
ENTRYPOINT ["/bin/bash", "/usr/local/bin/monitor-container-resources.bash"]
