FROM ruby:3.1.1

RUN apt-get -qq update && apt-get -qqy install --no-install-recommends \
    build-essential=12.9 \
    chrpath=0.16-2+b1 \
    libxft-dev=2.3.2-2 && rm -rf /var/lib/apt/lists/*
RUN wget --progress=dot:giga https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/share/ && \
    ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/
