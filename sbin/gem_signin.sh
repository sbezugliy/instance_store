#!/usr/bin/env bash
gem signin
echo "---
:rubygems_api_key: ${RUBYGEMS_KEY}
" > ~/.gem/ credentials
