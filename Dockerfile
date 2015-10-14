
FROM ubuntu:14.04
MAINTAINER nicolas Rineau "nicolas.rineau@rhinosys.fr"

ENV DEBIAN_FRONTEND noninteractive

RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list
RUN apt-get install -y python-software-properties
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs git
RUN git clone https://github.com/c9/core.git
RUN cd /cloud9 && npm install

VOLUME ["/workspace"]

EXPOSE 3131
CMD ["/cloud9/bin/cloud9.sh", "-l", "0.0.0.0", "-w", "/workspace"]
