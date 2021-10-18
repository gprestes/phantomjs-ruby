FROM ruby:3.0.2

RUN apt-get -qq update && apt-get -qqy install --no-install-recommends \
    build-essential=12.9 \
    chrpath=0.16-2+b1 \
    libxft-dev=2.3.2-2 && rm -rf /var/lib/apt/lists/*
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/share/
RUN ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/
