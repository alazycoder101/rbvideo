FROM ruby:3.1.0-alpine

# for heroku exec
RUN apk add bash openssl curl iproute2
ADD ./.profile.d /app/.profile.d

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ARG app=/app
WORKDIR $app

ADD Gemfile ./

RUN bundle install --jobs 4 --retry 3

ADD . ./

ARG PORT=9595
EXPOSE $PORT
CMD bundle exec rackup config.ru -o 0.0.0.0 -p 9595
