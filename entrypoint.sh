#!/bin/bash
set -e

rm -f /aile/tmp/pids/server.pid
bundle update --bundler
bundle config set --local path 'vendor/bundle'

# bundle exec gem install foreman
bundle install
bundle exec rails db:create
bundle exec rails db:migrate

yarn install

bundle exec whenever --update-crontab
cron start &

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
