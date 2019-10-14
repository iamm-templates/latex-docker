FROM blang/latex:ctanbasic
MAINTAINER Benedikt Lang <mail@blang.io>

RUN tlmgr install scheme-full
RUN tlmgr install lstfiracode polyglossia minted fvextra ifplatform cancel xwatermark catoptions ltxkeys biblatex-gost
RUN apt-get update \
    && apt-get install -qy python python-pip \
    && pip install pygments
