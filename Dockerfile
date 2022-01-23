FROM ruby:3.1.0-alpine

RUN apk add bash curl \
    make gcc libc-dev # for ruby-prof
ARG app=/opt/app
WORKDIR $app

ADD Gemfile ./

RUN bundle install --jobs 4 --retry 3

ADD . ./

ARG PORT=9595
EXPOSE $PORT
CMD bundle exec rackup config.ru -o 0.0.0.0 -p 9595
