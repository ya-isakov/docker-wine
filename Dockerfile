FROM i386/ubuntu:latest
RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq && \
    apt-get install -qqy --no-install-recommends wget apt-transport-https software-properties-common && \
    wget -qnc --no-check-certificate https://repos.wine-staging.com/wine/Release.key && \
    apt-key add Release.key && \
    apt-add-repository 'https://dl.winehq.org/wine-builds/ubuntu/' && \
    apt-get update -qq && \
    apt-get install -qqy winehq-staging && \
    apt-get purge -qqy --auto-remove software-properties-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*
