# Pin npm packages by running ./bin/importmap
# 
# pin "application"
# pin_all_from 'app/javascript/controllers', under: 'controllers', integrity: true
# pin_all_from 'app/javascript/channels', under: 'channels', integrity: true
# pin "stimulus_reflex" # @3.5.5
# pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
# pin "@rails/actioncable", to: "@rails--actioncable.js" # @8.0.300
# pin "cable_ready" # @5.0.6
# pin "morphdom" # @2.6.1
# pin "bootstrap" # @5.3.8
# pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
# Pin npm packages by running ./bin/importmap

enable_integrity!


pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers", to: 'controllers'
pin_all_from "app/javascript/channels", under: "channels", to: 'channels', preload: true
pin "bootstrap", to: "bootstrap.bundle.min.js"
pin "@rails/actioncable", to: "@rails--actioncable.js" # @8.0.300

pin "application"