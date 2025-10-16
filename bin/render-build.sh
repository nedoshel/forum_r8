#!/usr/bin/env bash

set -o errexit

bundle install
bin/rails assets:precompile
bin/rails assets:clean

bin/rails db:schema:load:cache DISABLE_DATABASE_ENVIRONMENT_CHECK=1
bin/rails db:schema:load:queue DISABLE_DATABASE_ENVIRONMENT_CHECK=1
bin/rails db:schema:load:cable DISABLE_DATABASE_ENVIRONMENT_CHECK=1
bin/rails db:migrate
