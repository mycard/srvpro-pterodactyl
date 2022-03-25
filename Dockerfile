# Dockerfile for SRVPro on Pterodactyl
FROM git-registry.mycard.moe/mycard/srvpro:master-x86

# apt
RUN apt update && \
    env DEBIAN_FRONTEND=noninteractive apt install -y gettext-base && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* /var/log/* && \ 
    useradd -ms /bin/bash container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./motd.txt /home/motd.txt
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT []
CMD ["/bin/bash", "/entrypoint.sh"]
