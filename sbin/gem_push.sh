#!/usr/bin/env bash
gem push $(ls -t instance_store-*.gem | head -1)
