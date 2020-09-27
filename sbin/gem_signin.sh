#!/usr/bin/env bash
mkdir -p ~/.gem
echo "---
:rubygems_api_key: ${RUBYGEMS_KEY}
" > ~/.gem/credentials
gem signin
