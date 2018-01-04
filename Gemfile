# encoding: utf-8
source 'http://rubygems.org'

gem 'rack'
gem 'rake'
gem 'sinatra'
gem 'pony'
gem 'sqlite3'
gem 'activerecord', '~> 3.0'
gem 'sinatra-activerecord', '~> 1.2.2'

group :nanoc do
  gem 'nanoc', '3.6.3'
  gem 'sprockets', ' ~> 2.9.3'
  gem 'sprockets-sass', '~> 1.0.0'
  gem 'sprockets-helpers', '~> 1.0.1'
  gem 'compass', '~> 0.12.2'
  gem 'uglifier'
  gem 'therubyracer'
  gem 'nanoc-sprockets-filter'
  gem 'nanoc-gzip-filter'
end

group :development do
  gem 'capistrano', '~> 2.15.4'
  gem 'railsless-deploy'
  gem 'tux'
end

group :development, :test do
end

group :guard do
  gem 'rb-fsevent'
  gem 'guard'

  gem 'guard-bundler'

  gem 'livereload'
  gem 'guard-livereload'
end
