FROM ghcr.io/graalvm/truffleruby:debian

ARG app=/opt/app
WORKDIR $app

ADD Gemfile ./

RUN bundle install --jobs 4 --retry 3
