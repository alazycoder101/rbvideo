FROM ghcr.io/graalvm/truffleruby:debian

ARG app=/opt/app
WORKDIR $app

ADD Gemfile ./

RUN bundle install --jobs 4 --retry 3

ADD . ./

EXPOSE 9595
CMD bundle exec rackup config.ru -o 0.0.0.0 -p 9595
