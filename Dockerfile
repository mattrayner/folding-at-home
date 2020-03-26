FROM debian:buster-slim AS builder

ENV DEBIAN_FRONTEND=noninteractive

ENV FAH_VERSION_MINOR=7.5.1
ENV FAH_VERSION_MAJOR=7.5

# application configuration params
RUN apt update && \
    apt install --no-install-recommends -y bzip2

ADD https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v${FAH_VERSION_MAJOR}/fahclient_${FAH_VERSION_MINOR}_amd64.deb /tmp/fah.deb
RUN mkdir -p /etc/fahclient/ && \
    touch /etc/fahclient/config.xml && \
    dpkg -i /tmp/fah.deb

RUN apt remove -y curl && \
    apt autoremove && \
    dpkg-deb -c /tmp/fah.deb && \
    rm --recursive --verbose --force /tmp/* /var/log/* /var/lib/apt/


FROM debian:stable-slim

ENV WEB_ALLOW=0/0
ENV ALLOW=0/0
ENV GPU=false
ENV SMP=true
# other available power modes include: light and full
ENV POWER=medium
ENV FAH_USER=Anonymous
ENV FAH_TEAM=0

COPY --from=builder /usr/bin/FAH* /usr/bin/

# Web viewer
EXPOSE 7396 36330

RUN groupadd -g 9999 folder && \
    useradd -r -b /home -u 9999 -g folder folder

RUN mkdir /home/folder && chown folder:folder /home/folder && chmod 700 /home/folder
ADD start_folding.sh /home/folder/
# USER folder

WORKDIR /home/folder

ENTRYPOINT ["/home/folder/start_folding.sh"]