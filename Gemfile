source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'thin'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
gem "jquery-rails"
gem 'devise'
gem 'devise_invitable'
gem "omniauth", "~> 0.3.0.rc3"
gem 'oa-openid', :require => 'omniauth/openid'
gem 'cancan'
gem 'fog'
gem "paperclip", "~> 2.3"
gem "state_machine"
gem 'will_paginate', '~> 3.0'
gem 'event-calendar', :require => 'event_calendar'

group :development, :test do
  gem "cucumber-rails"
  gem "database_cleaner"
  gem "capybara"
  gem "rspec-rails", ">= 2.0.1"
  gem "shoulda-matchers"
  gem 'faker'
end

gem 'simplecov', '>= 0.4.0', :require => false, :group => :test
gem 'factory_girl_rails', :require => false, :group => :test

group :development do
  gem 'guard'
  gem 'awesome_print'
  gem 'growl_notify' if RUBY_PLATFORM =~ /darwin/i
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem "launchy"
  gem 'rb-fsevent'
  gem 'guard-cucumber'
  gem 'guard-coffeescript'
  gem 'guard-livereload'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  #gem 'guard-rails-assets'
  #gem 'guard-sprockets'
  gem 'guard-uglify'
  gem 'spork', '~> 0.9.0.rc'
  gem 'rails-footnotes', '>= 3.7'
end
