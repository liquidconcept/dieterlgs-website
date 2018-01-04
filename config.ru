# encoding: utf-8
#\ -w
$: << File.expand_path('..', __FILE__)

require 'rubygems' if RUBY_VERSION < '1.9'
require 'bundler/setup'
require 'app/website'

map '/' do
  use Application::Website
end

map '/admin' do
  use Application::Admin
end

# run Rack::URLMap.new({
#   "/" => Application::Website,
#   "/admin" => Application::Admin
# })
