# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'
gem 'rails', '~> 5.2.1'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'pg'
gem 'puma', '~> 3.11'
gem 'rails_12factor'
gem 'turbolinks', '~> 5.2.0'
gem 'uglifier'

# authentication
gem 'devise_token_auth'
# management env variables
gem 'figaro'
# jsonapi
gem 'jsonapi-rails'
# cors rules
gem 'rack-cors', require: 'rack/cors'
# form objects
gem 'reform'
# docs
gem 'apipie-rails'
# authorization
gem 'cancancan', '~> 2.0'
# file uploaders
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'
# position
gem 'acts_as_list'

group :development, :test do
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.8'
  gem 'rubocop'
end

group :development do
  gem 'bullet'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'faker'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', require: false
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
