FROM ruby:2.7.1

RUN mkdir -p /opt/app
WORKDIR /opt/app

COPY ./lib/instance_store/version.rb ./lib/instance_store/
COPY ./Gemfile ./
COPY instance_store.gemspec ./
COPY ./Gemfile.lock ./

RUN bundle check || bundle install

COPY ./sbin/entrypoint.sh ./sbin/
