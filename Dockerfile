FROM debian:buster-slim

ENV FAH_VERSION_MINOR=7.5.1
ENV FAH_VERSION_MAJOR=7.5

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --no-install-recommends -y \
        curl adduser bzip2 &&\
        curl --insecure https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v${FAH_VERSION_MAJOR}/fahclient_${FAH_VERSION_MINOR}_amd64.deb > /tmp/fah.deb &&\
        mkdir -p /etc/fahclient/ &&\
        touch /etc/fahclient/config.xml &&\
        dpkg --install /tmp/fah.deb &&\
        apt-get remove -y curl &&\
        apt-get autoremove -y &&\
        rm --recursive --verbose --force /tmp/* /var/log/* /var/lib/apt/

# Web viewer
EXPOSE 7396

ENTRYPOINT ["FAHClient", "--web-allow=0/0:7396", "--allow=0/0:7396"]
CMD ["--user=Anonymous", "--team=0", "--gpu=false", "--smp=true", "--power=full"]
