FROM ruby:2.7.1

RUN mkdir -p /opt/app
WORKDIR /opt/app

COPY ./lib/instantiator/version.rb ./lib/instantiator/
COPY ./Gemfile ./
COPY ./instantiator.gemspec ./
COPY ./Gemfile.lock ./

RUN bundle check || bundle install

COPY ./sbin/entrypoint.sh ./sbin/
