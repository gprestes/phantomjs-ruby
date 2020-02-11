FROM ruby:2.7.0

RUN apt-get -qq update && apt-get -qqy install --no-install-recommends \
    build-essential=12.6 \
    chrpath=0.16-2+b1 \
    libxft-dev=2.3.2-2 && rm -rf /var/lib/apt/lists/*
ENV PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
RUN wget "https://github.com/Medium/phantomjs/releases/download/v2.1.1/$PHANTOM_JS.tar.bz2"
RUN tar xvjf $PHANTOM_JS.tar.bz2
RUN mv $PHANTOM_JS /usr/local/share
RUN ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
RUN rm -rf $PHANTOM_JS.tar.bz2