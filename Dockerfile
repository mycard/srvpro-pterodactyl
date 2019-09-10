# Dockerfile for SRVPro on YL
FROM node:12-stretch-slim

# apt
#COPY sources.list /etc/apt/sources.list
RUN apt update && \
    env DEBIAN_FRONTEND=noninteractive apt install -y build-essential libevent-dev libsqlite3-dev mono-complete p7zip-full envsubst curl && \
    rm -rf /var/lib/apt/lists/* && \ 
    useradd -ms /bin/bash container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
