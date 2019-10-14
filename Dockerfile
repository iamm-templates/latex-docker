# viktor@tiulp.in, 2019
# ==================================================================
# module list
# ------------------------------------------------------------------
# python         3.6    (apt)
# wget           latest (apt)
# perl           latest (apt)
# fonts-config   latest (apt)
# fonts-cmu      latest (apt)
# fonts-firasans latest (github)
# texlive	 2019   (ctan)
# pygments       latest (pip)
# ==================================================================
FROM ubuntu:bionic
MAINTAINER Viktor Tiulpin <viktor@tiulp.in>
ENV DEBIAN_FRONTEND noninteractive

# update the system
RUN apt-get -qq update
# install required in our templates tools and fonts
RUN apt-get -y -q install wget perl python python-pip libfontconfig fonts-cmu fonts-firacode
RUN pip install pygments
RUN wget https://github.com/bBoxType/FiraSans/archive/master.zip -O master.zip; \
    unzip master.zip; \
    sudo mkdir -p /usr/share/fonts/opentype/fira; \
    sudo mkdir -p /usr/share/fonts/truetype/fira; \
    sudo find FiraSans-master/ -name "*.otf" -exec cp {} /usr/share/fonts/opentype/fira/ \; \
    sudo find FiraSans-master/ -name "*.ttf" -exec cp {} /usr/share/fonts/truetype/fira/ \;

# install TexLive with scheme-full
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz; \
    mkdir /install-tl-unx; \
    tar -xvf install-tl-unx.tar.gz -C /install-tl-unx --strip-components=1; \
    echo "selected_scheme scheme-full" >> /install-tl-unx/texlive.profile; \
    /install-tl-unx/install-tl -profile /install-tl-unx/texlive.profile; \
    rm -r /install-tl-unx; \
    rm install-tl-unx.tar.gz

# set up working directory and used volume
ENV PATH="/usr/local/texlive/2019/bin/x86_64-linux:${PATH}"
ENV HOME /data
WORKDIR /data
VOLUME ["/data"]
