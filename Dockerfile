FROM guitsaru/unidic-mecab

RUN apt-get update && \
  apt-get install -y --no-install-recommends wget build-essential autotools-dev automake && \
  rm -rf /var/lib/apt/lists/*

RUN wget -O - https://bitbucket.org/eunjeon/mecab-ko/downloads/mecab-0.996-ko-0.9.2.tar.gz | tar zxfv -
RUN cd mecab-0.996-ko-0.9.2; ./configure; make; make install; ldconfig

RUN wget -O - https://bitbucket.org/eunjeon/mecab-ko-dic/downloads/mecab-ko-dic-2.0.1-20150920.tar.gz | tar zxfv -
RUN cd mecab-ko-dic-2.0.1-20150920; sh ./autogen.sh; ./configure; make; make install; ldconfig; rm -rf mecab-*

RUN apt-get remove -y wget build-essential

RUN rm -rf mecab-*