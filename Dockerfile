# Dockerfile for SRVPro on YL
FROM node:12-buster-slim

# apt
#COPY sources.list /etc/apt/sources.list
RUN apt update && \
    env DEBIAN_FRONTEND=noninteractive apt install -y build-essential libevent-dev libsqlite3-dev mono-complete p7zip-full gettext-base liblua5.3-dev && \
    rm -rf /var/lib/apt/lists/* && \ 
    useradd -ms /bin/bash container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./motd.txt /home/motd.txt
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
