FROM nginx as build

WORKDIR /build

RUN apt-get update \
  && apt-get install -y build-essential

RUN curl --location --output entr.tar.gz https://github.com/eradman/entr/archive/refs/tags/4.9.tar.gz \
  && mkdir entr \
  && tar -xzf entr.tar.gz -C entr --strip-components 1 \
  && cd entr \
  && ./configure \
  && CFLAGS="-static" make test \
  && PREFIX=$(pwd) make install

FROM nginx

ENV ENTR_INOTIFY_WORKAROUND=1
COPY --from=build /build/entr/bin/entr /usr/local/bin/entr

COPY start.sh /start.sh

CMD ["/start.sh"]
