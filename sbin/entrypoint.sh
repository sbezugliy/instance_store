#!/usr/bin/env bash
bundle check || bundle install
bundle exec guard --no-bundler-warning --no-interactions
