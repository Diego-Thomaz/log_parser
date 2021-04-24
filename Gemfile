# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.0.0'

gem 'rake', '~> 13.0'

group :development do
  gem 'rubocop', '~> 0.80' # if not running rubocop in the CI, we can let it as a development dependency
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
end
