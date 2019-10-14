FROM ubuntu:latest
MAINTAINER Viktor Tiulpin <viktor@tiulp.in>
ENV DEBIAN_FRONTEND noninteractive

# update the system
RUN apt-get -qq update
RUN apt-get -y -q install wget perl python python-pip libfontconfig fonts-cmu
RUN pip install pygments

# install TexLive with scheme-full
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz; \
	mkdir /install-tl-unx; \
	tar -xvf install-tl-unx.tar.gz -C /install-tl-unx --strip-components=1; \
    echo "selected_scheme scheme-full" >> /install-tl-unx/texlive.profile; \
	/install-tl-unx/install-tl -profile /install-tl-unx/texlive.profile; \
    rm -r /install-tl-unx; \
	rm install-tl-unx.tar.gz

ENV PATH="/usr/local/texlive/2019/bin/x86_64-linux:${PATH}"
ENV HOME /data
WORKDIR /data
VOLUME ["/data"]
