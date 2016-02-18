source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.2'

# Use SCSS for stylesheets
# gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
# gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# gem 'responders', '~> 2.0'
gem 'responders'
gem 'pundit'

gem 'slim-rails'
gem 'devise'
gem 'mysql2'
# gem 'pg'

gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'

gem 'unicorn'
gem 'will_paginate'

gem 'whenever'

gem 'oj'
gem 'oj_mimic_json'
gem 'therubyracer'

gem 'dotenv'
gem 'dotenv-deployment', require: 'dotenv/deployment'

gem 'carrierwave'
gem 'remotipart'
gem 'cocoon'

gem 'recaptcha', :require => "recaptcha/rails"
gem 'bcrypt'


group :test do
  gem 'shoulda-matchers'
  gem 'rubocop'
  gem 'capybara'
  gem 'launchy'
  gem 'database_cleaner'
  # gem 'selenium-webdriver'
  gem 'capybara-webkit'
  gem 'json_spec'
end

gem 'foundation-rails'
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'foundation-icons-sass-rails'
end

group :development, :test do
  # gem 'pg'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-rails'
  gem 'pry-byebug'

  # delete assets records from rails s log
  gem 'quiet_assets'

  # to format the error logs
  gem "better_errors"
  gem "binding_of_caller"

  # for rails panel
  gem 'meta_request'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara-email'
  gem "letter_opener"
end

group :development do
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-sidekiq', require: false
  gem 'capistrano3-unicorn', require: false
end

