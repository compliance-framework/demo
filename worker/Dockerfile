FROM ubuntu

# Setup the base image as though it is a real server
RUN apt-get update && \
    apt-get install wget openssh-server golang-go git vim -y

# Install the CCF agent
ARG AGENT_VERSION="0.1.8"
RUN wget https://github.com/compliance-framework/agent/archive/refs/tags/v${AGENT_VERSION}.tar.gz -O agent.tar.gz && \
    tar -xzf agent.tar.gz && \
    mv agent-${AGENT_VERSION} agent && \
    rm agent.tar.gz

# Build the CCF agent into a `concom` binary, which serves as the primary process in this machine. \
# This is primarily done to avoid OCI complexities. This will later change to pull a built binary from an OCI registry,
# which is immediately executable.
RUN cd agent && \
    go build -o concom main.go && \
    cd .. && \
    cp agent/concom ./concom

COPY ./sshd.conf /etc/ssh/sshd_config.d/sshd.conf
COPY ./entrypoint.sh /entrypoint.sh

CMD ["sh", "-C", "/entrypoint.sh"]
