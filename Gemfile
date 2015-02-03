# encoding: utf-8
source 'http://rubygems.org'

gem 'rack'
gem 'rake'
gem 'sinatra'
gem 'pony'
gem 'sqlite3'
gem 'activerecord'
gem 'sinatra-activerecord'

group :nanoc do
  gem 'nanoc'
  gem 'sprockets'
  gem 'sprockets-sass'
  gem 'sprockets-helpers'
  gem 'sass'
  gem 'compass'
  gem 'uglifier'
  gem 'therubyracer', '0.12.0'
  gem 'libv8', '3.16.14.3'
  gem 'nanoc-sprockets-filter'
  gem 'nanoc-gzip-filter'
end

group :development do
  gem 'capistrano'
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
